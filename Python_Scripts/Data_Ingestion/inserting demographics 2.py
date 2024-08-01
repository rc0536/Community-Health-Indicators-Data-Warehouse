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
    'CoreStatisticsStage',
    'DemographicStatisticsStage'
    

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
county_data = demographics_data[['County_FIPS_Code', 'CHSI_County_Name', 'State_FIPS_Code']].drop_duplicates()


# Insert the strata data into the StrataStage table
insert_dataframe_into_table(county_data, 'CountyStage', cursor_staging)

# strata table
# Extract strata-related information. 
strata_data = demographics_data[['Strata_ID_Number', 'Strata_Determining_Factors']].drop_duplicates()




# Example age group IDs
age_group_ids = {
    'Under age 1': 1,
    'Ages 1-14': 2,
    'Ages 15-24': 3,
    'Ages 25-44': 4,
    'Ages 45-64': 5,
    'Ages 65+': 6,
    'Age 19 and under': 7,
    'Age 19-64': 8,
    'Age 65-84': 9,
    'Age 85 and over': 10
}

# Example race ID for White 
race_id_white = 1  

columns_to_use = ['County_FIPS_Code', 'State_FIPS_Code', 'White']

# Assuming the correct column names for age group statistics based on your description
age_group_columns = {
    'Age 19 and under': ['Min_Age_19_Under', 'Max_Age_19_Under'],
    'Age 19-64': ['Min_Age_19_64', 'Max_Age_19_65'],  # Note the correction here based on your description
    'Age 65-84': ['Min_Age_65_84', 'Max_Age_65_85'],  # Assuming a typo in the max age column name
    'Age 85 and over': ['Min_Age_85_and_Over', 'Max_Age_85_and_Over']
}

# Prepare the data for insertion
age_groups_data = []
for age_group, columns in age_group_columns.items():
    age_group_id = age_group_ids[age_group]  # Get the age group ID
    df = demographics_data[columns_to_use].copy()  # Start with the base columns
    for col in columns:  
        if col in demographics_data.columns:
            df[col] = demographics_data[col]
        else:
            print(f"Column {col} not found in CSV file.")
    df['AgeGroup_ID'] = age_group_id
    df['Race_ID'] = race_id_white
    age_groups_data.append(df)

# Insert the data for each age group
for age_group_df in age_groups_data:

    insert_dataframe_into_table(age_group_df, 'DemographicStatisticsStage', cursor_staging)
