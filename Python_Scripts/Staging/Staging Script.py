import pyodbc
import pandas as pd

# Define your connection string to the database
conn_str_staging = 'DRIVER={ODBC Driver 17 for SQL Server};SERVER=RAYS-PC\\SQLEXPRESS;DATABASE=HealthDataStaging;Trusted_Connection=yes;'
conn_staging = pyodbc.connect(conn_str_staging)
cursor_staging = conn_staging.cursor()

# Function to execute a stored procedure and commit changes
def execute_stored_procedure(cursor, procedure_name):
    try:
        cursor.execute(f"EXEC {procedure_name}")
        conn_staging.commit()
        print(f"{procedure_name} execution complete.")
    except pyodbc.Error as e:
        print(f"An error occurred during {procedure_name} execution:", e)

# Execute stored procedures for staging tables creation, data insertion, and data cleaning
execute_stored_procedure(cursor_staging, "CreateStagingTables")


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
    'DemographicStatisticsStage',
    'RaceStage',
    'StatisticCategoriesStage',
    'AgeGroupStage',
    'LifestyleRiskFactorsStage',
    'RiskFactorStatisticsStage'
    

]

# Truncate the tables
truncate_tables(cursor_staging, tables_to_truncate)

# execute store procedure for inserting static values
execute_stored_procedure(cursor_staging, "InsertStagingTables")

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

strata_data = demographics_data[['Strata_ID_Number', 'Strata_Determining_Factors']].drop_duplicates()


# Execute procedure DemographicCleaningAndUploading
execute_stored_procedure(cursor_staging, "DemographicCleaningAndUploading")

# Execute procedure LeadingCauseOfDeathCleaningAndUploading
execute_stored_procedure(cursor_staging, "LeadingCauseOfDeathCleaningAndUploading")

# Execute procedure LifestyleRiskFactorInsertingAndCleaning
execute_stored_procedure(cursor_staging, "LifestyleRiskFactorInsertingAndCleaning")

# Clean up: close cursor and connection
cursor_staging.close()
conn_staging.close()
