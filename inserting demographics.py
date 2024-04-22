import pandas as pd
import pyodbc

# Define your connection string and connect to the database
conn_str_staging = 'DRIVER={ODBC Driver 17 for SQL Server};SERVER=RAYS-PC\\SQLEXPRESS;DATABASE=HealthDataStaging;Trusted_Connection=yes;'
conn_staging = pyodbc.connect(conn_str_staging)
cursor_staging = conn_staging.cursor()

# Load the CSV file
file_path = 'F:\\Boston\\CS779\\Project\\health-chsi-to-combat-obesity\\chsi_dataset\\DEMOGRAPHICS.csv'
demographics_data = pd.read_csv(file_path)

# Function to truncate
def truncate_tables(cursor, tables):
    """
    Truncates the given tables.
    """
    for table in tables:
        print(f"Truncating table: {table}")
        cursor.execute(f"TRUNCATE TABLE {table}")
    cursor.connection.commit()

# Specify the tables to truncate
tables_to_truncate = [
    'StateStage',
    'CountyStage',
    'StrataStage',
    'PovertyDataStage',
    'AgeGroupDataStage',
    'RaceDataStage',
    

]

# Truncate the tables
truncate_tables(cursor_staging, tables_to_truncate)


#Function to insert
def insert_dataframe_into_table(dataframe, table_name, cursor):
    """
    Insert data from a pandas DataFrame into a specified table.
    """
    columns = ', '.join([f"[{col}]" for col in dataframe.columns])  # Bracket column names to handle special characters
    placeholders = ', '.join(['?'] * len(dataframe.columns))
    sql = f"INSERT INTO {table_name} ({columns}) VALUES ({placeholders})"
    
    data_tuples = list(dataframe.itertuples(index=False, name=None))
    
    try:
        cursor.executemany(sql, data_tuples)
        cursor.connection.commit()
    except Exception as e:
        print(f"Error inserting into {table_name}: {e}")
        cursor.connection.rollback()

# Preparing DataFrames for each table
# State Table
state_data = demographics_data[['State_FIPS_Code', 'CHSI_State_Name', 'CHSI_State_Abbr']].drop_duplicates()

# Insert the strata data into the StrataStage table
insert_dataframe_into_table(state_data, 'StateStage', cursor_staging)

# County Table
county_data = demographics_data[['County_FIPS_Code', 'CHSI_County_Name', 'Population_Size', 'Min_Population_Size', 'Max_Population_Size', 'Population_Density', 'Min_Population_Density', 'Max_Population_Density', 'State_FIPS_Code']].drop_duplicates()


# Insert the strata data into the StrataStage table
insert_dataframe_into_table(county_data, 'CountyStage', cursor_staging)

# strata table
# Extract strata-related information. Ensure the data has unique strata entries
strata_data = demographics_data[['Strata_ID_Number', 'Strata_Determining_Factors']].drop_duplicates()


# Insert the strata data into the StrataStage table
insert_dataframe_into_table(strata_data, 'StrataStage', cursor_staging)


# First, we prepare the DataFrame for the poverty data
poverty_data = demographics_data[['County_FIPS_Code', 'Poverty', 'Min_Poverty', 'Max_Poverty']].copy()
poverty_data.columns = ['County_FIPS_Code', 'Poverty', 'Min_Poverty', 'Max_Poverty']

# Now, we use the function to insert the data into the PovertyDataStage table
insert_dataframe_into_table(poverty_data, 'PovertyDataStage', cursor_staging)

# Preparing DataFrame for AgeGroupDataStage table
age_groups = [
    {'group': 'Age_19_Under', 'value': 'Age_19_Under', 'min': 'Min_Age_19_Under', 'max': 'Max_Age_19_Under'},
    {'group': 'Age_19_64', 'value': 'Age_19_64', 'min': 'Min_Age_19_64', 'max': 'Max_Age_19_65'},
    {'group': 'Age_65_84', 'value': 'Age_65_84', 'min': 'Min_Age_65_84', 'max': 'Max_Age_65_85'},
    {'group': 'Age_85_and_Over', 'value': 'Age_85_and_Over', 'min': 'Min_Age_85_and_Over', 'max': 'Max_Age_85_and_Over'}
]

for group in age_groups:
    # Extract data for each age group
    group_data = demographics_data[['County_FIPS_Code', group['value'], group['min'], group['max']]].copy()
    
    # Rename columns to match the AgeGroupDataStage schema
    group_data.columns = ['County_FIPS_Code', 'Percentage', 'Min_Percentage', 'Max_Percentage']
    
    # Add the Age_Group column
    group_data['Age_Group'] = group['group']
    
    # Insert the data into the AgeGroupDataStage table
    insert_dataframe_into_table(group_data, 'AgeGroupDataStage', cursor_staging)


# Prepare the DataFrame for the RaceDataStage table
race_columns = [
    ('White', 'Min_White', 'Max_White'),
    ('Black', 'Min_Black', 'Max_Black'),
    ('Native_American', 'Min_Native_American', 'Max_Native_American'),
    ('Asian', 'Min_Asian', 'Max_Asian'),
    ('Hispanic', 'Min_Hispanic', 'Max_Hispanic')
]

# Prepare and insert race data for each race category
for race, min_race, max_race in race_columns:
    race_data = demographics_data[['County_FIPS_Code', race, min_race, max_race]].copy()
    
    # Map the DataFrame columns to the schema of RaceDataStage table
   
    race_data.rename(columns={race: 'Percentage', min_race: 'Min_Percentage', max_race: 'Max_Percentage'}, inplace=True)
    
    # Add the 'Race' column based on the current loop iteration
    race_data['Race'] = race
    
    # Insert the data into the RaceDataStage table, RaceData_ID will be auto-generated
    insert_dataframe_into_table(race_data, 'RaceDataStage', cursor_staging)



