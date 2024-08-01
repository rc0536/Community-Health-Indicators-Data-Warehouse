import pyodbc

# Define your connection string to the database
conn_str_staging = 'DRIVER={ODBC Driver 17 for SQL Server};SERVER=RAYS-PC\\SQLEXPRESS;DATABASE=CountyHealthData;Trusted_Connection=yes;'
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
execute_stored_procedure(cursor_staging, "CreateTables")


execute_stored_procedure(cursor_staging, "InsertTablesWithoutDependencies")

execute_stored_procedure(cursor_staging, "InsertTablesWithDependencies")