CREATE OR ALTER PROCEDURE LifestyleRiskFactorInsertingAndCleaning
AS
BEGIN
	 BEGIN TRY
        -- Start a transaction
        BEGIN TRANSACTION;

		DROP TABLE IF EXISTS RiskFactorsAndAccessToCare;
		CREATE TABLE RiskFactorsAndAccessToCare (
		State_FIPS_Code INT,
		County_FIPS_Code INT,
		CHSI_County_Name VARCHAR(255),
		CHSI_State_Name VARCHAR(255),
		CHSI_State_Abbr VARCHAR(255),
		Strata_ID_Number VARCHAR(255),
		No_Exercise VARCHAR(255),
		CI_Min_No_Exercise VARCHAR(255),
		CI_Max_No_Exercise VARCHAR(255),
		Few_Fruit_Veg VARCHAR(255),
		CI_Min_Fruit_Veg VARCHAR(255),
		CI_Max_Fruit_Veg VARCHAR(255),
		Obesity VARCHAR(255),
		CI_Min_Obesity VARCHAR(255),
		CI_Max_Obesity VARCHAR(255),
		High_Blood_Pres VARCHAR(255),
		CI_Min_High_Blood_Pres VARCHAR(255),
		CI_Max_High_Blood_Pres VARCHAR(255),
		Smoker VARCHAR(255),
		CI_Min_Smoker VARCHAR(255),
		CI_Max_Smoker VARCHAR(255),
		Diabetes VARCHAR(255),
		CI_Min_Diabetes VARCHAR(255),
		CI_Max_Diabetes VARCHAR(255),
		Uninsured VARCHAR(255),
		Elderly_Medicare VARCHAR(255),
		Disabled_Medicare VARCHAR(255),
		Prim_Care_Phys_Rate VARCHAR(255),
		Dentist_Rate VARCHAR(255),
		Community_Health_Center_Ind VARCHAR(255),
		HPSA_Ind VARCHAR(255)
	);

		--  BULK INSERT
		BULK INSERT RiskFactorsAndAccessToCare
		FROM 'F:\\Boston\\CS779\\Project\\health-chsi-to-combat-obesity\\chsi_dataset\\RISKFACTORSANDACCESSTOCARE.csv'  -- 
		WITH
		(
			FIRSTROW = 2,  -- Assuming the first row contains column headers
			FIELDTERMINATOR = ',',  -- Staying with comma, 
			ROWTERMINATOR = '0x0a',  -- Line feed character for row termination
			TABLOCK  -- Use table-level locking during the bulk load, improving performance
		);



		-- changes all negative values to nulls
		DECLARE @Sql NVARCHAR(MAX);

		SET @Sql = '';

		SELECT @Sql = @Sql + 
		'UPDATE RiskFactorsAndAccessToCare SET ' + QUOTENAME(COLUMN_NAME) + ' = NULL WHERE ' + QUOTENAME(COLUMN_NAME) + ' IN (''-2222'', ''-2222.2'', ''-2'', ''-1111.1'', ''-1111'', ''-1''); '
		FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_NAME = 'RiskFactorsAndAccessToCare'
		AND DATA_TYPE = 'varchar';

		EXEC sp_executesql @Sql;

		INSERT INTO RiskFactorStatisticsStage (Value, CI_Min, CI_Max, County_ID, Category_ID, LifestyleRiskFactor_ID)
		SELECT 
			r.No_Exercise, 
			r.CI_Min_No_Exercise, 
			r.CI_Max_No_Exercise,
			c.County_ID,
			6 as Category_ID,
			1 as LifestyleRiskFactor_ID -- Assuming 1 is the ID for No Exercise
		FROM 
			RiskFactorsAndAccessToCare as r
		JOIN 
			CountyStage as c ON r.County_FIPS_Code = c.County_FIPS_Code AND r.State_FIPS_Code = c.State_FIPS_Code
		WHERE
			r.No_Exercise IS NOT NULL;
        -- Commit the transaction
        COMMIT TRANSACTION;
		END TRY
		BEGIN CATCH
			-- Rollback the transaction if there is an error
			IF @@TRANCOUNT > 0
			BEGIN
				ROLLBACK TRANSACTION;
			END

			-- Error handling
			DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
			DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
			DECLARE @ErrorState INT = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
		END CATCH
END