CREATE OR ALTER PROCEDURE LeadingCauseOfDeathCleaningAndUploading
AS
BEGIN
	 BEGIN TRY
        -- Start a transaction
        BEGIN TRANSACTION;

		DROP TABLE IF EXISTS LeadingCausesOfDeath;
		CREATE TABLE LeadingCausesOfDeath (
			State_FIPS_Code INT,
			County_FIPS_Code INT,
			CHSI_County_Name VARCHAR(255),
			CHSI_State_Name VARCHAR(255),
			CHSI_State_Abbr VARCHAR(255),
			Strata_ID_Number VARCHAR(255),
			A_Wh_Comp VARCHAR(255),
			CI_Min_A_Wh_Comp VARCHAR(255),
			CI_Max_A_Wh_Comp VARCHAR(255),
			A_Bl_Comp VARCHAR(255),
			CI_Min_A_Bl_Comp VARCHAR(255),
			CI_Max_A_Bl_Comp VARCHAR(255),
			A_Ot_Comp VARCHAR(255),
			CI_Min_A_Ot_Comp VARCHAR(255),
			CI_Max_A_Ot_Comp VARCHAR(255),
			A_Hi_Comp VARCHAR(255),
			CI_Min_A_Hi_Comp VARCHAR(255),
			CI_Max_A_Hi_Comp VARCHAR(255),
			A_Wh_BirthDef VARCHAR(255),
			CI_Min_A_Wh_BirthDef VARCHAR(255),
			CI_Max_A_Wh_BirthDef VARCHAR(255),
			A_Bl_BirthDef VARCHAR(255),
			CI_Min_A_Bl_BirthDef VARCHAR(255),
			CI_Max_A_Bl_BirthDef VARCHAR(255),
			A_Ot_BirthDef VARCHAR(255),
			CI_Min_A_Ot_BirthDef VARCHAR(255),
			CI_Max_A_Ot_BirthDef VARCHAR(255),
			A_Hi_BirthDef VARCHAR(255),
			CI_Min_A_Hi_BirthDef VARCHAR(255),
			CI_Max_A_Hi_BirthDef VARCHAR(255),
			B_Wh_Injury VARCHAR(255),
			CI_Min_B_Wh_Injury VARCHAR(255),
			CI_Max_B_Wh_Injury VARCHAR(255),
			B_Bl_Injury VARCHAR(255),
			CI_Min_B_Bl_Injury VARCHAR(255),
			CI_Max_B_Bl_Injury VARCHAR(255),
			B_Ot_Injury VARCHAR(255),
			CI_Min_B_Ot_Injury VARCHAR(255),
			CI_Max_B_Ot_Injury VARCHAR(255),
			B_Hi_Injury VARCHAR(255),
			CI_Min_B_Hi_Injury VARCHAR(255),
			CI_Max_B_Hi_Injury VARCHAR(255),
			B_Wh_Cancer VARCHAR(255),
			CI_Min_B_Wh_Cancer VARCHAR(255),
			CI_Max_B_Wh_Cancer VARCHAR(255),
			B_Bl_Cancer VARCHAR(255),
			CI_Min_B_Bl_Cancer VARCHAR(255),
			CI_Max_B_Bl_Cancer VARCHAR(255),
			B_Ot_Cancer VARCHAR(255),
			CI_Min_B_Ot_Cancer VARCHAR(255),
			CI_Max_B_Ot_Cancer VARCHAR(255),
			B_Hi_Cancer VARCHAR(255),
			CI_Min_B_Hi_Cancer VARCHAR(255),
			CI_Max_B_Hi_Cancer VARCHAR(255),
			B_Wh_Homicide VARCHAR(255),
			CI_Min_B_Wh_Homicide VARCHAR(255),
			CI_Max_B_Wh_Homicide VARCHAR(255),
			B_Bl_Homicide VARCHAR(255),
			CI_Min_B_Bl_Homicide VARCHAR(255),
			CI_Max_B_Bl_Homicide VARCHAR(255),
			B_Ot_Homicide VARCHAR(255),
			CI_Min_B_Ot_Homicide VARCHAR(255),
			CI_Max_B_Ot_Homicide VARCHAR(255),
			B_Hi_Homicide VARCHAR(255),
			CI_Min_B_Hi_Homicide VARCHAR(255),
			CI_Max_B_Hi_Homicide VARCHAR(255),
			C_Wh_Injury VARCHAR(255),
			CI_Min_C_Wh_Injury VARCHAR(255),
			CI_Max_C_Wh_Injury VARCHAR(255),
			C_Bl_Injury VARCHAR(255),
			CI_Min_C_Bl_Injury VARCHAR(255),
			CI_Max_C_Bl_Injury VARCHAR(255),
			C_Ot_Injury VARCHAR(255),
			CI_Min_C_Ot_Injury VARCHAR(255),
			CI_Max_C_Ot_Injury VARCHAR(255),
			C_Hi_Injury VARCHAR(255),
			CI_Min_C_Hi_Injury VARCHAR(255),
			CI_Max_C_Hi_Injury VARCHAR(255),
			C_Wh_Homicide VARCHAR(255),
			CI_Min_C_Wh_Homicide VARCHAR(255),
			CI_Max_C_Wh_Homicide VARCHAR(255),
			C_Bl_Homicide VARCHAR(255),
			CI_Min_C_Bl_Homicide VARCHAR(255),
			CI_Max_C_Bl_Homicide VARCHAR(255),
			C_Ot_homicide VARCHAR(255),
			CI_Min_C_Ot_homicide VARCHAR(255),
			CI_Max_C_Ot_homicide VARCHAR(255),
			C_Hi_Homicide VARCHAR(255),
			CI_Min_C_Hi_Homicide VARCHAR(255),
			CI_Max_C_Hi_Homicide VARCHAR(255),
			C_Wh_Suicide VARCHAR(255),
			CI_Min_C_Wh_Suicide VARCHAR(255),
			CI_Max_C_Wh_Suicide VARCHAR(255),
			C_Bl_Suicide VARCHAR(255),
			CI_Min_C_Bl_Suicide VARCHAR(255),
			CI_Max_C_Bl_Suicide VARCHAR(255),
			C_Ot_Suicide VARCHAR(255),
			CI_Min_C_Ot_Suicide VARCHAR(255),
			CI_Max_C_Ot_Suicide VARCHAR(255),
			C_Hi_Suicide VARCHAR(255),
			CI_Min_C_Hi_Suicide VARCHAR(255),
			CI_Max_C_Hi_Suicide VARCHAR(255),
			C_Wh_Cancer VARCHAR(255),
			CI_Min_C_Wh_Cancer VARCHAR(255),
			CI_Max_C_Wh_Cancer VARCHAR(255),
			C_Bl_Cancer VARCHAR(255),
			CI_Min_C_Bl_Cancer VARCHAR(255),
			CI_Max_C_Bl_Cancer VARCHAR(255),
			C_Ot_Cancer VARCHAR(255),
			CI_Min_C_Ot_Cancer VARCHAR(255),
			CI_Max_C_Ot_Cancer VARCHAR(255),
			C_Hi_Cancer VARCHAR(255),
			CI_Min_C_Hi_Cancer VARCHAR(255),
			CI_Max_C_Hi_Cancer VARCHAR(255),
			D_Wh_Injury VARCHAR(255),
			CI_Min_D_Wh_Injury VARCHAR(255),
			CI_Max_D_Wh_Injury VARCHAR(255),
			D_Bl_Injury VARCHAR(255),
			CI_Min_D_Bl_Injury VARCHAR(255),
			CI_Max_D_Bl_Injury VARCHAR(255),
			D_Ot_Injury VARCHAR(255),
			CI_Min_D_Ot_Injury VARCHAR(255),
			CI_Max_D_Ot_Injury VARCHAR(255),
			D_Hi_Injury VARCHAR(255),
			CI_Min_D_Hi_Injury VARCHAR(255),
			CI_Max_D_Hi_Injury VARCHAR(255),
			D_Wh_Cancer VARCHAR(255),
			CI_Min_D_Wh_Cancer VARCHAR(255),
			CI_Max_D_Wh_Cancer VARCHAR(255),
			D_Bl_Cancer VARCHAR(255),
			CI_Min_D_Bl_Cancer VARCHAR(255),
			CI_Max_D_Bl_Cancer VARCHAR(255),
			D_Ot_Cancer VARCHAR(255),
			CI_Min_D_Ot_Cancer VARCHAR(255),
			CI_Max_D_Ot_Cancer VARCHAR(255),
			D_Hi_Cancer VARCHAR(255),
			CI_Min_D_Hi_Cancer VARCHAR(255),
			CI_Max_D_Hi_Cancer VARCHAR(255),
			D_Wh_HeartDis VARCHAR(255),
			CI_Min_D_Wh_HeartDis VARCHAR(255),
			CI_Max_D_Wh_HeartDis VARCHAR(255),
			D_Bl_HeartDis VARCHAR(255),
			CI_Min_D_Bl_HeartDis VARCHAR(255),
			CI_Max_D_Bl_HeartDis VARCHAR(255),
			D_Ot_HeartDis VARCHAR(255),
			CI_Min_D_Ot_HeartDis VARCHAR(255),
			CI_Max_D_Ot_HeartDis VARCHAR(255),
			D_Hi_HeartDis VARCHAR(255),
			CI_Min_D_Hi_HeartDis VARCHAR(255),
			CI_Max_D_Hi_HeartDis VARCHAR(255),
			D_Wh_Suicide VARCHAR(255),
			CI_Min_D_Wh_Suicide VARCHAR(255),
			CI_Max_D_Wh_Suicide VARCHAR(255),
			D_Bl_Suicide VARCHAR(255),
			CI_Min_D_Bl_Suicide VARCHAR(255),
			CI_Max_D_Bl_Suicide VARCHAR(255),
			D_Ot_Suicide VARCHAR(255),
			CI_Min_D_Ot_Suicide VARCHAR(255),
			CI_Max_D_Ot_Suicide VARCHAR(255),
			D_Hi_Suicide VARCHAR(255),
			CI_Min_D_Hi_Suicide VARCHAR(255),
			CI_Max_D_Hi_Suicide VARCHAR(255),
			D_Wh_HIV VARCHAR(255),
			CI_Min_D_Wh_HIV VARCHAR(255),
			CI_Max_D_Wh_HIV VARCHAR(255),
			D_Bl_HIV VARCHAR(255),
			CI_Min_D_Bl_HIV VARCHAR(255),
			CI_Max_D_Bl_HIV VARCHAR(255),
			D_Ot_HIV VARCHAR(255),
			CI_Min_D_Ot_HIV VARCHAR(255),
			CI_Max_D_Ot_HIV VARCHAR(255),
			D_Hi_HIV VARCHAR(255),
			CI_Min_D_Hi_HIV VARCHAR(255),
			CI_Max_D_Hi_HIV VARCHAR(255),
			D_Wh_Homicide VARCHAR(255),
			CI_Min_D_Wh_Homicide VARCHAR(255),
			CI_Max_D_Wh_Homicide VARCHAR(255),
			D_Bl_Homicide VARCHAR(255),
			CI_Min_D_Bl_Homicide VARCHAR(255),
			CI_Max_D_Bl_Homicide VARCHAR(255),
			D_Ot_Homicide VARCHAR(255),
			CI_Min_D_Ot_Homicide VARCHAR(255),
			CI_Max_D_Ot_Homicide VARCHAR(255),
			D_Hi_Homicide VARCHAR(255),
			CI_Min_D_Hi_Homicide VARCHAR(255),
			CI_Max_D_Hi_Homicide VARCHAR(255),
			E_Wh_Cancer VARCHAR(255),
			CI_Min_E_Wh_Cancer VARCHAR(255),
			CI_Max_E_Wh_Cancer VARCHAR(255),
			E_Bl_Cancer VARCHAR(255),
			CI_Min_E_Bl_Cancer VARCHAR(255),
			CI_Max_E_Bl_Cancer VARCHAR(255),
			E_Ot_Cancer VARCHAR(255),
			CI_Min_E_Ot_Cancer VARCHAR(255),
			CI_Max_E_Ot_Cancer VARCHAR(255),
			E_Hi_Cancer VARCHAR(255),
			CI_Min_E_Hi_Cancer VARCHAR(255),
			CI_Max_E_Hi_Cancer VARCHAR(255),
			E_Wh_HeartDis VARCHAR(255),
			CI_Min_E_Wh_HeartDis VARCHAR(255),
			CI_Max_E_Wh_HeartDis VARCHAR(255),
			E_Bl_HeartDis VARCHAR(255),
			CI_Min_E_Bl_HeartDis VARCHAR(255),
			CI_Max_E_Bl_HeartDis VARCHAR(255),
			E_Ot_HeartDis VARCHAR(255),
			CI_Min_E_Ot_HeartDis VARCHAR(255),
			CI_Max_E_Ot_HeartDis VARCHAR(255),
			E_Hi_HeartDis VARCHAR(255),
			CI_Min_E_Hi_HeartDis VARCHAR(255),
			CI_Max_E_Hi_HeartDis VARCHAR(255),
			F_Wh_HeartDis VARCHAR(255),
			CI_Min_F_Wh_HeartDis VARCHAR(255),
			CI_Max_F_Wh_HeartDis VARCHAR(255),
			F_Bl_HeartDis VARCHAR(255),
			CI_Min_F_Bl_HeartDis VARCHAR(255),
			CI_Max_F_Bl_HeartDis VARCHAR(255),
			F_Ot_HeartDis VARCHAR(255),
			CI_Min_F_Ot_HeartDis VARCHAR(255),
			CI_Max_F_Ot_HeartDis VARCHAR(255),
			F_Hi_HeartDis VARCHAR(255),
			CI_Min_F_Hi_HeartDis VARCHAR(255),
			CI_Max_F_Hi_HeartDis VARCHAR(255),
			F_Wh_Cancer VARCHAR(255),
			CI_Min_F_Wh_Cancer VARCHAR(255),
			CI_Max_F_Wh_Cancer VARCHAR(255),
			F_Bl_Cancer VARCHAR(255),
			CI_Min_F_Bl_Cancer VARCHAR(255),
			CI_Max_F_Bl_Cancer VARCHAR(255),
			F_Ot_Cancer VARCHAR(255),
			CI_Min_F_Ot_Cancer VARCHAR(255),
			CI_Max_F_Ot_Cancer VARCHAR(255),
			F_Hi_Cancer VARCHAR(255),
			CI_Min_F_Hi_Cancer VARCHAR(255),
			CI_Max_F_Hi_Cancer VARCHAR(255),
			LCD_Time_Span VARCHAR(255)
		);

		--  BULK INSERT
		BULK INSERT LeadingCausesOfDeath
		FROM 'F:\\Boston\\CS779\\Project\\health-chsi-to-combat-obesity\\chsi_dataset\\LeadingCausesOfDeath.csv'  -- 
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
		'UPDATE LeadingCausesOfDeath SET ' + QUOTENAME(COLUMN_NAME) + ' = NULL WHERE ' + QUOTENAME(COLUMN_NAME) + ' IN (''-2222'', ''-2222.2'', ''-2'', ''-1111.1'', ''-1111'', ''-1''); '
		FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_NAME = 'LeadingCausesOfDeath'
		AND DATA_TYPE = 'varchar';

		EXEC sp_executesql @Sql;


		--Insertation Process
		-- Complication of preganacy for white individuals
		INSERT INTO DeathMeasuresStatisticsStage (Value, CI_Min_value, CI_Max_value, Race_ID, County_ID, Category_ID, CauseOfDeath_ID)
		SELECT 
			A_Wh_Comp AS Value, 
			CI_Min_A_Wh_Comp AS CI_Min_value, 
			CI_Max_A_Wh_Comp AS CI_Max_value, 
			1 AS Race_ID, -- 1 is the ID for White
			cs.County_ID, 
			9 AS Category_ID, -- For leading cause of death
			1 AS CauseOfDeath_ID -- 1 is the ID for Complications of pregnancy/birth
		FROM 
			LeadingCausesOfDeath lcd
		INNER JOIN CountyStage cs ON 
			lcd.County_FIPS_Code = cs.County_FIPS_Code AND 
			lcd.State_FIPS_Code = cs.State_FIPS_Code
		WHERE
			lcd.A_Wh_Comp IS NOT NULL;
	
		-- Complication of preganacy for Black individuals
		INSERT INTO DeathMeasuresStatisticsStage (Value, CI_Min_value, CI_Max_value, Race_ID, County_ID, Category_ID, CauseOfDeath_ID)
		SELECT 
			A_Bl_Comp AS Value, 
			CI_Min_A_Bl_Comp AS CI_Min_value, 
			CI_Max_A_Bl_Comp AS CI_Max_value, 
			2 AS Race_ID, -- ID for Black
			cs.County_ID, 
			9 AS Category_ID, -- Leading cause of death
			1 AS CauseOfDeath_ID -- ID for Complications of pregnancy/birth
		FROM 
			LeadingCausesOfDeath lcd
		INNER JOIN CountyStage cs ON 
			lcd.County_FIPS_Code = cs.County_FIPS_Code AND 
			lcd.State_FIPS_Code = cs.State_FIPS_Code
		WHERE
			lcd.A_Bl_Comp IS NOT NULL;
			
		-- Complication of preganacy for other individuals
		INSERT INTO DeathMeasuresStatisticsStage (Value, CI_Min_value, CI_Max_value, Race_ID, County_ID, Category_ID, CauseOfDeath_ID)
		SELECT 
			A_Ot_Comp AS Value, 
			CI_Min_A_Ot_Comp AS CI_Min_value, 
			CI_Max_A_Ot_Comp AS CI_Max_value, 
			6 AS Race_ID, -- ID for Other
			cs.County_ID, 
			9 AS Category_ID, -- Leading cause of death
			1 AS CauseOfDeath_ID -- ID for Complications of pregnancy/birth
		FROM 
			LeadingCausesOfDeath lcd
		INNER JOIN CountyStage cs ON 
			lcd.County_FIPS_Code = cs.County_FIPS_Code AND 
			lcd.State_FIPS_Code = cs.State_FIPS_Code
		WHERE
			lcd.A_Ot_Comp IS NOT NULL;
	
		-- Complication of preganacy for hispanic individuals
		INSERT INTO DeathMeasuresStatisticsStage (Value, CI_Min_value, CI_Max_value, Race_ID, County_ID, Category_ID, CauseOfDeath_ID)
		SELECT 
			A_Hi_Comp AS Value, 
			CI_Min_A_Hi_Comp AS CI_Min_value, 
			CI_Max_A_Hi_Comp AS CI_Max_value, 
			5 AS Race_ID, -- ID for Hispanic
			cs.County_ID, 
			9 AS Category_ID, -- Leading cause of death
			1 AS CauseOfDeath_ID -- ID for Complications of pregnancy/birth
		FROM 
			LeadingCausesOfDeath lcd
		INNER JOIN CountyStage cs ON 
			lcd.County_FIPS_Code = cs.County_FIPS_Code AND 
			lcd.State_FIPS_Code = cs.State_FIPS_Code
		WHERE
			lcd.A_Hi_Comp IS NOT NULL;
		
		-- Birth defects for White individuals
		INSERT INTO DeathMeasuresStatisticsStage (Value, CI_Min_value, CI_Max_value, Race_ID, County_ID, Category_ID, CauseOfDeath_ID)
		SELECT 
			A_Wh_BirthDef AS Value, 
			CI_Min_A_Wh_BirthDef AS CI_Min_value, 
			CI_Max_A_Wh_BirthDef AS CI_Max_value, 
			1 AS Race_ID, -- White
			cs.County_ID, 
			9 AS Category_ID, -- Leading cause of death
			2 AS CauseOfDeath_ID -- Birth defects
		FROM 
			LeadingCausesOfDeath lcd
		INNER JOIN CountyStage cs ON 
			lcd.County_FIPS_Code = cs.County_FIPS_Code AND 
			lcd.State_FIPS_Code = cs.State_FIPS_Code
		WHERE
			lcd.A_Wh_BirthDef IS NOT NULL;
		
		-- Birth defects for Black individuals
		INSERT INTO DeathMeasuresStatisticsStage (Value, CI_Min_value, CI_Max_value, Race_ID, County_ID, Category_ID, CauseOfDeath_ID)
		SELECT 
			A_Bl_BirthDef AS Value, 
			CI_Min_A_Bl_BirthDef AS CI_Min_value, 
			CI_Max_A_Bl_BirthDef AS CI_Max_value, 
			2 AS Race_ID, -- Black
			cs.County_ID, 
			9 AS Category_ID, -- Leading cause of death
			2 AS CauseOfDeath_ID -- Birth defects
		FROM 
			LeadingCausesOfDeath lcd
		INNER JOIN CountyStage cs ON 
			lcd.County_FIPS_Code = cs.County_FIPS_Code AND 
			lcd.State_FIPS_Code = cs.State_FIPS_Code
		WHERE
			lcd.A_Bl_BirthDef IS NOT NULL;

		-- Birth defects for Hispanic individuals		
		INSERT INTO DeathMeasuresStatisticsStage (Value, CI_Min_value, CI_Max_value, Race_ID, County_ID, Category_ID, CauseOfDeath_ID)
		SELECT 
			A_Hi_BirthDef AS Value, 
			CI_Min_A_Hi_BirthDef AS CI_Min_value, 
			CI_Max_A_Hi_BirthDef AS CI_Max_value, 
			5 AS Race_ID, -- Hispanic
			cs.County_ID, 
			9 AS Category_ID, -- Leading cause of death
			2 AS CauseOfDeath_ID -- Birth defects
		FROM 
			LeadingCausesOfDeath lcd
		INNER JOIN CountyStage cs ON 
			lcd.County_FIPS_Code = cs.County_FIPS_Code AND 
			lcd.State_FIPS_Code = cs.State_FIPS_Code
		WHERE
			lcd.A_Hi_BirthDef IS NOT NULL;
		
		-- Birth defects for Other individuals	
		INSERT INTO DeathMeasuresStatisticsStage (Value, CI_Min_value, CI_Max_value, Race_ID, County_ID, Category_ID, CauseOfDeath_ID)
		SELECT 
			A_Ot_BirthDef AS Value, 
			CI_Min_A_Ot_BirthDef AS CI_Min_value, 
			CI_Max_A_Ot_BirthDef AS CI_Max_value, 
			6 AS Race_ID, -- Other
			cs.County_ID, 
			9 AS Category_ID, -- Leading cause of death
			2 AS CauseOfDeath_ID -- Birth defects
		FROM 
			LeadingCausesOfDeath lcd
		INNER JOIN CountyStage cs ON 
			lcd.County_FIPS_Code = cs.County_FIPS_Code AND 
			lcd.State_FIPS_Code = cs.State_FIPS_Code
		WHERE
			lcd.A_Ot_BirthDef IS NOT NULL;

		-- Cause of Death: Injuries, Race: White
		INSERT INTO DeathMeasuresStatisticsStage (Value, CI_Min_value, CI_Max_value, Race_ID, County_ID, Category_ID, CauseOfDeath_ID)
		SELECT 
			B_Wh_Injury AS Value, 
			CI_Min_B_Wh_Injury AS CI_Min_value, 
			CI_Max_B_Wh_Injury AS CI_Max_value, 
			1 AS Race_ID, -- White
			cs.County_ID, 
			9 AS Category_ID, -- Leading cause of death
			3 AS CauseOfDeath_ID -- Injuries
		FROM 
			LeadingCausesOfDeath lcd
		INNER JOIN CountyStage cs ON 
			lcd.County_FIPS_Code = cs.County_FIPS_Code AND 
			lcd.State_FIPS_Code = cs.State_FIPS_Code
		WHERE
			lcd.B_Wh_Injury IS NOT NULL;

		-- Cause of Death: Injuries, Race: Black
		INSERT INTO DeathMeasuresStatisticsStage (Value, CI_Min_value, CI_Max_value, Race_ID, County_ID, Category_ID, CauseOfDeath_ID)
		SELECT 
			B_Bl_Injury AS Value, 
			CI_Min_B_Bl_Injury AS CI_Min_value, 
			CI_Max_B_Bl_Injury AS CI_Max_value, 
			2 AS Race_ID, -- Black
			cs.County_ID, 
			9 AS Category_ID, -- Leading cause of death
			3 AS CauseOfDeath_ID -- Injuries
		FROM 
			LeadingCausesOfDeath lcd
		INNER JOIN CountyStage cs ON 
			lcd.County_FIPS_Code = cs.County_FIPS_Code AND 
			lcd.State_FIPS_Code = cs.State_FIPS_Code
		WHERE
			lcd.B_Bl_Injury IS NOT NULL;

		-- Cause of Death: Injuries, Race: Hispanic
		INSERT INTO DeathMeasuresStatisticsStage (Value, CI_Min_value, CI_Max_value, Race_ID, County_ID, Category_ID, CauseOfDeath_ID)
		SELECT 
			B_Hi_Injury AS Value, 
			CI_Min_B_Hi_Injury AS CI_Min_value, 
			CI_Max_B_Hi_Injury AS CI_Max_value, 
			5 AS Race_ID, -- Hispanic
			cs.County_ID, 
			9 AS Category_ID, -- Leading cause of death
			3 AS CauseOfDeath_ID -- Injuries
		FROM 
			LeadingCausesOfDeath lcd
		INNER JOIN CountyStage cs ON 
			lcd.County_FIPS_Code = cs.County_FIPS_Code AND 
			lcd.State_FIPS_Code = cs.State_FIPS_Code
		WHERE
			lcd.B_Hi_Injury IS NOT NULL;

		-- Cause of Death: Injuries, Race: Other
		INSERT INTO DeathMeasuresStatisticsStage (Value, CI_Min_value, CI_Max_value, Race_ID, County_ID, Category_ID, CauseOfDeath_ID)
		SELECT 
			B_Ot_Injury AS Value, 
			CI_Min_B_Ot_Injury AS CI_Min_value, 
			CI_Max_B_Ot_Injury AS CI_Max_value, 
			6 AS Race_ID, -- Other
			cs.County_ID, 
			9 AS Category_ID, -- Leading cause of death
			3 AS CauseOfDeath_ID -- Injuries
		FROM 
			LeadingCausesOfDeath lcd
		INNER JOIN CountyStage cs ON 
			lcd.County_FIPS_Code = cs.County_FIPS_Code AND 
			lcd.State_FIPS_Code = cs.State_FIPS_Code
		WHERE
			lcd.B_Ot_Injury IS NOT NULL;

		-- Cause of Death: Cancer, Race: White
		INSERT INTO DeathMeasuresStatisticsStage (Value, CI_Min_value, CI_Max_value, Race_ID, County_ID, Category_ID, CauseOfDeath_ID)
		SELECT 
			B_Wh_Cancer AS Value, 
			CI_Min_B_Wh_Cancer AS CI_Min_value, 
			CI_Max_B_Wh_Cancer AS CI_Max_value, 
			1 AS Race_ID, -- White
			cs.County_ID, 
			9 AS Category_ID, -- Leading cause of death
			4 AS CauseOfDeath_ID -- Cancer
		FROM 
			LeadingCausesOfDeath lcd
		INNER JOIN CountyStage cs ON 
			lcd.County_FIPS_Code = cs.County_FIPS_Code AND 
			lcd.State_FIPS_Code = cs.State_FIPS_Code
		WHERE
			lcd.B_Wh_Cancer IS NOT NULL;

		-- Cause of Death: Cancer, Race: Black
		INSERT INTO DeathMeasuresStatisticsStage (Value, CI_Min_value, CI_Max_value, Race_ID, County_ID, Category_ID, CauseOfDeath_ID)
		SELECT 
			B_Bl_Cancer AS Value, 
			CI_Min_B_Bl_Cancer AS CI_Min_value, 
			CI_Max_B_Bl_Cancer AS CI_Max_value, 
			2 AS Race_ID, -- Black
			cs.County_ID, 
			9 AS Category_ID, -- Leading cause of death
			4 AS CauseOfDeath_ID -- Cancer
		FROM 
			LeadingCausesOfDeath lcd
		INNER JOIN CountyStage cs ON 
			lcd.County_FIPS_Code = cs.County_FIPS_Code AND 
			lcd.State_FIPS_Code = cs.State_FIPS_Code
		WHERE
			lcd.B_Bl_Cancer IS NOT NULL;

		-- Cause of Death: Cancer, Race: Hispanic
		INSERT INTO DeathMeasuresStatisticsStage (Value, CI_Min_value, CI_Max_value, Race_ID, County_ID, Category_ID, CauseOfDeath_ID)
		SELECT 
			B_Hi_Cancer AS Value, 
			CI_Min_B_Hi_Cancer AS CI_Min_value, 
			CI_Max_B_Hi_Cancer AS CI_Max_value, 
			5 AS Race_ID, -- Hispanic
			cs.County_ID, 
			9 AS Category_ID, -- Leading cause of death
			4 AS CauseOfDeath_ID -- Cancer
		FROM 
			LeadingCausesOfDeath lcd
		INNER JOIN CountyStage cs ON 
			lcd.County_FIPS_Code = cs.County_FIPS_Code AND 
			lcd.State_FIPS_Code = cs.State_FIPS_Code
		WHERE
			lcd.B_Hi_Cancer IS NOT NULL;

		-- Cause of Death: Cancer, Race: Other
		INSERT INTO DeathMeasuresStatisticsStage (Value, CI_Min_value, CI_Max_value, Race_ID, County_ID, Category_ID, CauseOfDeath_ID)
		SELECT 
			B_Ot_Cancer AS Value, 
			CI_Min_B_Ot_Cancer AS CI_Min_value, 
			CI_Max_B_Ot_Cancer AS CI_Max_value, 
			6 AS Race_ID, -- Other
			cs.County_ID, 
			9 AS Category_ID, -- Leading cause of death
			4 AS CauseOfDeath_ID -- Cancer
		FROM 
			LeadingCausesOfDeath lcd
		INNER JOIN CountyStage cs ON 
			lcd.County_FIPS_Code = cs.County_FIPS_Code AND 
			lcd.State_FIPS_Code = cs.State_FIPS_Code
		WHERE
			lcd.B_Ot_Cancer IS NOT NULL;

		-- Cause of Death: Homicide, Race: White
		INSERT INTO DeathMeasuresStatisticsStage (Value, CI_Min_value, CI_Max_value, Race_ID, County_ID, Category_ID, CauseOfDeath_ID)
		SELECT 
			B_Wh_Homicide AS Value, 
			CI_Min_B_Wh_Homicide AS CI_Min_value, 
			CI_Max_B_Wh_Homicide AS CI_Max_value, 
			1 AS Race_ID, -- White
			cs.County_ID, 
			9 AS Category_ID, -- Leading cause of death
			5 AS CauseOfDeath_ID -- Homicide
		FROM 
			LeadingCausesOfDeath lcd
		INNER JOIN CountyStage cs ON 
			lcd.County_FIPS_Code = cs.County_FIPS_Code AND 
			lcd.State_FIPS_Code = cs.State_FIPS_Code
		WHERE
			lcd.B_Wh_Homicide IS NOT NULL;

		-- Cause of Death: Homicide, Race: Black
		INSERT INTO DeathMeasuresStatisticsStage (Value, CI_Min_value, CI_Max_value, Race_ID, County_ID, Category_ID, CauseOfDeath_ID)
		SELECT 
			B_Bl_Homicide AS Value, 
			CI_Min_B_Bl_Homicide AS CI_Min_value, 
			CI_Max_B_Bl_Homicide AS CI_Max_value, 
			2 AS Race_ID, -- Black
			cs.County_ID, 
			9 AS Category_ID, -- Leading cause of death
			5 AS CauseOfDeath_ID -- Homicide
		FROM 
			LeadingCausesOfDeath lcd
		INNER JOIN CountyStage cs ON 
			lcd.County_FIPS_Code = cs.County_FIPS_Code AND 
			lcd.State_FIPS_Code = cs.State_FIPS_Code
		WHERE
			lcd.B_Bl_Homicide IS NOT NULL;

			-- Cause of Death: Homicide, Race: Hispanic
		INSERT INTO DeathMeasuresStatisticsStage (Value, CI_Min_value, CI_Max_value, Race_ID, County_ID, Category_ID, CauseOfDeath_ID)
		SELECT 
			B_Hi_Homicide AS Value, 
			CI_Min_B_Hi_Homicide AS CI_Min_value, 
			CI_Max_B_Hi_Homicide AS CI_Max_value, 
			5 AS Race_ID, -- Hispanic
			cs.County_ID, 
			9 AS Category_ID, -- Leading cause of death
			5 AS CauseOfDeath_ID -- Homicide
		FROM 
			LeadingCausesOfDeath lcd
		INNER JOIN CountyStage cs ON 
			lcd.County_FIPS_Code = cs.County_FIPS_Code AND 
			lcd.State_FIPS_Code = cs.State_FIPS_Code
		WHERE
			lcd.B_Hi_Homicide IS NOT NULL;

			-- Cause of Death: Homicide, Race: Other
		INSERT INTO DeathMeasuresStatisticsStage (Value, CI_Min_value, CI_Max_value, Race_ID, County_ID, Category_ID, CauseOfDeath_ID)
		SELECT 
			B_Ot_Homicide AS Value, 
			CI_Min_B_Ot_Homicide AS CI_Min_value, 
			CI_Max_B_Ot_Homicide AS CI_Max_value, 
			6 AS Race_ID, -- Other
			cs.County_ID, 
			9 AS Category_ID, -- Leading cause of death
			5 AS CauseOfDeath_ID -- Homicide
		FROM 
			LeadingCausesOfDeath lcd
		INNER JOIN CountyStage cs ON 
			lcd.County_FIPS_Code = cs.County_FIPS_Code AND 
			lcd.State_FIPS_Code = cs.State_FIPS_Code
		WHERE
			lcd.B_Ot_Homicide IS NOT NULL;

		-- Cause of Death: Heart Disease, Race: White
		INSERT INTO DeathMeasuresStatisticsStage (Value, CI_Min_value, CI_Max_value, Race_ID, County_ID, Category_ID, CauseOfDeath_ID)
		SELECT 
			D_Wh_HeartDis AS Value, 
			CI_Min_D_Wh_HeartDis AS CI_Min_value, 
			CI_Max_D_Wh_HeartDis AS CI_Max_value, 
			1 AS Race_ID, -- White
			cs.County_ID, 
			9 AS Category_ID, -- Leading cause of death
			6 AS CauseOfDeath_ID -- Heart Disease
		FROM 
			LeadingCausesOfDeath lcd
		INNER JOIN CountyStage cs ON 
			lcd.County_FIPS_Code = cs.County_FIPS_Code AND 
			lcd.State_FIPS_Code = cs.State_FIPS_Code
		WHERE
			lcd.D_Wh_HeartDis IS NOT NULL;

			-- Cause of Death: Heart Disease, Race: Black
		INSERT INTO DeathMeasuresStatisticsStage (Value, CI_Min_value, CI_Max_value, Race_ID, County_ID, Category_ID, CauseOfDeath_ID)
		SELECT 
			D_Bl_HeartDis AS Value, 
			CI_Min_D_Bl_HeartDis AS CI_Min_value, 
			CI_Max_D_Bl_HeartDis AS CI_Max_value, 
			2 AS Race_ID, -- Black
			cs.County_ID, 
			9 AS Category_ID, -- Leading cause of death
			6 AS CauseOfDeath_ID -- Heart Disease
		FROM 
			LeadingCausesOfDeath lcd
		INNER JOIN CountyStage cs ON 
			lcd.County_FIPS_Code = cs.County_FIPS_Code AND 
			lcd.State_FIPS_Code = cs.State_FIPS_Code
		WHERE
			lcd.D_Bl_HeartDis IS NOT NULL;

		-- Cause of Death: Heart Disease, Race: Hispanic
		INSERT INTO DeathMeasuresStatisticsStage (Value, CI_Min_value, CI_Max_value, Race_ID, County_ID, Category_ID, CauseOfDeath_ID)
		SELECT 
			D_Hi_HeartDis AS Value, 
			CI_Min_D_Hi_HeartDis AS CI_Min_value, 
			CI_Max_D_Hi_HeartDis AS CI_Max_value, 
			5 AS Race_ID, -- Hispanic
			cs.County_ID, 
			9 AS Category_ID, -- Leading cause of death
			6 AS CauseOfDeath_ID -- Heart Disease
		FROM 
			LeadingCausesOfDeath lcd
		INNER JOIN CountyStage cs ON 
			lcd.County_FIPS_Code = cs.County_FIPS_Code AND 
			lcd.State_FIPS_Code = cs.State_FIPS_Code
		WHERE
			lcd.D_Hi_HeartDis IS NOT NULL;

			-- Cause of Death: Heart Disease, Race: Other
		INSERT INTO DeathMeasuresStatisticsStage (Value, CI_Min_value, CI_Max_value, Race_ID, County_ID, Category_ID, CauseOfDeath_ID)
		SELECT 
			D_Ot_HeartDis AS Value, 
			CI_Min_D_Ot_HeartDis AS CI_Min_value, 
			CI_Max_D_Ot_HeartDis AS CI_Max_value, 
			6 AS Race_ID, -- Other
			cs.County_ID, 
			9 AS Category_ID, -- Leading cause of death
			6 AS CauseOfDeath_ID -- Heart Disease
		FROM 
			LeadingCausesOfDeath lcd
		INNER JOIN CountyStage cs ON 
			lcd.County_FIPS_Code = cs.County_FIPS_Code AND 
			lcd.State_FIPS_Code = cs.State_FIPS_Code
		WHERE
			lcd.D_Ot_HeartDis IS NOT NULL;

		-- Cause of Death: Suicide, Race: White
		INSERT INTO DeathMeasuresStatisticsStage (Value, CI_Min_value, CI_Max_value, Race_ID, County_ID, Category_ID, CauseOfDeath_ID)
		SELECT 
			D_Wh_Suicide AS Value, 
			CI_Min_D_Wh_Suicide AS CI_Min_value, 
			CI_Max_D_Wh_Suicide AS CI_Max_value, 
			1 AS Race_ID, -- White
			cs.County_ID, 
			9 AS Category_ID, -- Leading cause of death
			7 AS CauseOfDeath_ID -- Suicide
		FROM 
			LeadingCausesOfDeath lcd
		INNER JOIN CountyStage cs ON 
			lcd.County_FIPS_Code = cs.County_FIPS_Code AND 
			lcd.State_FIPS_Code = cs.State_FIPS_Code
		WHERE
			lcd.D_Wh_Suicide IS NOT NULL;

			-- Cause of Death: Suicide, Race: Black
		INSERT INTO DeathMeasuresStatisticsStage (Value, CI_Min_value, CI_Max_value, Race_ID, County_ID, Category_ID, CauseOfDeath_ID)
		SELECT 
			D_Bl_Suicide AS Value, 
			CI_Min_D_Bl_Suicide AS CI_Min_value, 
			CI_Max_D_Bl_Suicide AS CI_Max_value, 
			2 AS Race_ID, -- Black
			cs.County_ID, 
			9 AS Category_ID, -- Leading cause of death
			7 AS CauseOfDeath_ID -- Suicide
		FROM 
			LeadingCausesOfDeath lcd
		INNER JOIN CountyStage cs ON 
			lcd.County_FIPS_Code = cs.County_FIPS_Code AND 
			lcd.State_FIPS_Code = cs.State_FIPS_Code
		WHERE
			lcd.D_Bl_Suicide IS NOT NULL;

			-- Cause of Death: Suicide, Race: Hispanic
		INSERT INTO DeathMeasuresStatisticsStage (Value, CI_Min_value, CI_Max_value, Race_ID, County_ID, Category_ID, CauseOfDeath_ID)
		SELECT 
			D_Hi_Suicide AS Value, 
			CI_Min_D_Hi_Suicide AS CI_Min_value, 
			CI_Max_D_Hi_Suicide AS CI_Max_value, 
			5 AS Race_ID, -- Hispanic
			cs.County_ID, 
			9 AS Category_ID, -- Leading cause of death
			7 AS CauseOfDeath_ID -- Suicide
		FROM 
			LeadingCausesOfDeath lcd
		INNER JOIN CountyStage cs ON 
			lcd.County_FIPS_Code = cs.County_FIPS_Code AND 
			lcd.State_FIPS_Code = cs.State_FIPS_Code
		WHERE
			lcd.D_Hi_Suicide IS NOT NULL;

		-- Cause of Death: Suicide, Race: Other
		INSERT INTO DeathMeasuresStatisticsStage (Value, CI_Min_value, CI_Max_value, Race_ID, County_ID, Category_ID, CauseOfDeath_ID)
		SELECT 
			D_Ot_Suicide AS Value, 
			CI_Min_D_Ot_Suicide AS CI_Min_value, 
			CI_Max_D_Ot_Suicide AS CI_Max_value, 
			6 AS Race_ID, -- Other
			cs.County_ID, 
			9 AS Category_ID, -- Leading cause of death
			7 AS CauseOfDeath_ID -- Suicide
		FROM 
			LeadingCausesOfDeath lcd
		INNER JOIN CountyStage cs ON 
			lcd.County_FIPS_Code = cs.County_FIPS_Code AND 
			lcd.State_FIPS_Code = cs.State_FIPS_Code
		WHERE
			lcd.D_Ot_Suicide IS NOT NULL;
		
		-- Cause of Death: HIV/AIDS, Race: White
		INSERT INTO DeathMeasuresStatisticsStage (Value, CI_Min_value, CI_Max_value, Race_ID, County_ID, Category_ID, CauseOfDeath_ID)
		SELECT 
			D_Wh_HIV AS Value, 
			CI_Min_D_Wh_HIV AS CI_Min_value, 
			CI_Max_D_Wh_HIV AS CI_Max_value, 
			1 AS Race_ID, -- White
			cs.County_ID, 
			9 AS Category_ID, -- Leading cause of death
			8 AS CauseOfDeath_ID -- HIV/AIDS
		FROM 
			LeadingCausesOfDeath lcd
		INNER JOIN CountyStage cs ON 
			lcd.County_FIPS_Code = cs.County_FIPS_Code AND 
			lcd.State_FIPS_Code = cs.State_FIPS_Code
		WHERE
			lcd.D_Wh_HIV IS NOT NULL;

		-- Cause of Death: HIV/AIDS, Race: Black
		INSERT INTO DeathMeasuresStatisticsStage (Value, CI_Min_value, CI_Max_value, Race_ID, County_ID, Category_ID, CauseOfDeath_ID)
		SELECT 
			D_Bl_HIV AS Value, 
			CI_Min_D_Bl_HIV AS CI_Min_value, 
			CI_Max_D_Bl_HIV AS CI_Max_value, 
			2 AS Race_ID, -- Black
			cs.County_ID, 
			9 AS Category_ID, -- Leading cause of death
			8 AS CauseOfDeath_ID -- HIV/AIDS
		FROM 
			LeadingCausesOfDeath lcd
		INNER JOIN CountyStage cs ON 
			lcd.County_FIPS_Code = cs.County_FIPS_Code AND 
			lcd.State_FIPS_Code = cs.State_FIPS_Code
		WHERE
			lcd.D_Bl_HIV IS NOT NULL;

		-- Cause of Death: HIV/AIDS, Race: Hispanic
		INSERT INTO DeathMeasuresStatisticsStage (Value, CI_Min_value, CI_Max_value, Race_ID, County_ID, Category_ID, CauseOfDeath_ID)
		SELECT 
			D_Hi_HIV AS Value, 
			CI_Min_D_Hi_HIV AS CI_Min_value, 
			CI_Max_D_Hi_HIV AS CI_Max_value, 
			5 AS Race_ID, -- Hispanic
			cs.County_ID, 
			9 AS Category_ID, -- Leading cause of death
			8 AS CauseOfDeath_ID -- HIV/AIDS
		FROM 
			LeadingCausesOfDeath lcd
		INNER JOIN CountyStage cs ON 
			lcd.County_FIPS_Code = cs.County_FIPS_Code AND 
			lcd.State_FIPS_Code = cs.State_FIPS_Code
		WHERE
			lcd.D_Hi_HIV IS NOT NULL;

			-- Cause of Death: HIV/AIDS, Race: Other
		INSERT INTO DeathMeasuresStatisticsStage (Value, CI_Min_value, CI_Max_value, Race_ID, County_ID, Category_ID, CauseOfDeath_ID)
		SELECT 
			D_Ot_HIV AS Value, 
			CI_Min_D_Ot_HIV AS CI_Min_value, 
			CI_Max_D_Ot_HIV AS CI_Max_value, 
			6 AS Race_ID, -- Other
			cs.County_ID, 
			9 AS Category_ID, -- Leading cause of death
			8 AS CauseOfDeath_ID -- HIV/AIDS
		FROM 
			LeadingCausesOfDeath lcd
		INNER JOIN CountyStage cs ON 
			lcd.County_FIPS_Code = cs.County_FIPS_Code AND 
			lcd.State_FIPS_Code = cs.State_FIPS_Code
		WHERE
			lcd.D_Ot_HIV IS NOT NULL;
	COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Rollback the transaction if there is an error
        ROLLBACK TRANSACTION;

        -- Log the error information. You can replace this with your own error logging mechanism.
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        -- This prints the error message to the message output. In a production environment, you might insert the error details into an error log table.
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END