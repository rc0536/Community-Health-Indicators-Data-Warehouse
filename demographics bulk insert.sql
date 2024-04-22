CREATE OR ALTER PROCEDURE DemographicCleaningAndUploading
AS
BEGIN

	Drop table if exists DEMOGRAPHICS;
	CREATE TABLE DEMOGRAPHICS
(
	State_FIPS_Code INT,
	County_FIPS_Code INT,
	CHSI_County_Name VARCHAR(MAX),
	CHSI_State_Name VARCHAR(MAX),
	CHSI_State_Abbr VARCHAR(MAX),
	Strata_ID_Number VARCHAR(MAX),
	Strata_Determining_Factors VARCHAR(MAX),
	Number_Counties VARCHAR(MAX),
	Population_Size VARCHAR(MAX),
	Min_Population_Size VARCHAR(MAX),
	Max_Population_Size VARCHAR(MAX),
	Population_Density VARCHAR(MAX),
	Min_Population_Density VARCHAR(MAX),
	Max_Population_Density VARCHAR(MAX),
	Poverty VARCHAR(MAX),
	Min_Poverty VARCHAR(MAX),
	Max_Poverty VARCHAR(MAX),
	Age_19_Under VARCHAR(MAX),
	Min_Age_19_Under VARCHAR(MAX),
	Max_Age_19_Under VARCHAR(MAX),
	Age_19_64 VARCHAR(MAX),
	Min_Age_19_64 VARCHAR(MAX),
	Max_Age_19_65 VARCHAR(MAX), -- Corrected from Max_Age_19_65 to Max_Age_19_64
	Age_65_84 VARCHAR(MAX),
	Min_Age_65_84 VARCHAR(MAX),
	Max_Age_65_85 VARCHAR(MAX), -- Added this for consistency and to address the gap
	Age_85_and_Over VARCHAR(MAX),
	Min_Age_85_and_Over VARCHAR(MAX),
	Max_Age_85_and_Over VARCHAR(MAX),
	White VARCHAR(MAX),
	Min_White VARCHAR(MAX),
	Max_White VARCHAR(MAX),
	Black VARCHAR(MAX),
	Min_Black VARCHAR(MAX),
	Max_Black VARCHAR(MAX),
	Native_American VARCHAR(MAX),
	Min_Native_American VARCHAR(MAX),
	Max_Native_American VARCHAR(MAX),
	Asian VARCHAR(MAX),
	Min_Asian VARCHAR(MAX),
	Max_Asian VARCHAR(MAX),
	Hispanic VARCHAR(MAX),
	Min_Hispanic VARCHAR(MAX),
	Max_Hispanic VARCHAR(MAX)
)



	--  BULK INSERT
	BULK INSERT DEMOGRAPHICS
	FROM 'F:\\Boston\\CS779\\Project\\health-chsi-to-combat-obesity\\chsi_dataset\\DEMOGRAPHICS.csv'  -- 
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
	'UPDATE DEMOGRAPHICS SET ' + QUOTENAME(COLUMN_NAME) + ' = NULL WHERE ' + QUOTENAME(COLUMN_NAME) + ' IN (''-2222'', ''-2222.2'', ''-2'', ''-1111.1'', ''-1111'', ''-1''); '
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = 'DEMOGRAPHICS'
	AND DATA_TYPE = 'varchar';

	EXEC sp_executesql @Sql;

	-- Converts hispanic field to decimal
	UPDATE DEMOGRAPHICS
	SET [hispanic] = NULL
	WHERE TRY_CONVERT(DECIMAL(10, 2), [hispanic]) IS NULL
	AND [hispanic] IS NOT NULL;

	-- Inserts population data in demographic table
	INSERT INTO DemographicStatisticsStage (Value, Min_value, Max_value, County_ID, Category_ID)
	SELECT 
		CAST(d.Population_Size AS INT),
		d.Min_Population_Size,
		d.Max_Population_Size,
		c.County_ID,
		1 AS Category_ID -- category Id for poulation size
	FROM 
		DEMOGRAPHICS d
	INNER JOIN 
		CountyStage c ON d.County_FIPS_Code = c.County_FIPS_Code AND d.State_FIPS_Code = c.State_FIPS_Code;

		-- Inserts poverty data in demographic table
	INSERT INTO DemographicStatisticsStage (Value, Min_value, Max_value, County_ID, Category_ID)
	SELECT 
		CAST(d.Population_Density AS INT),
		d.Min_Population_Density,
		d.Max_Population_Density,
		c.County_ID,
		2 AS Category_ID 
	FROM 
		DEMOGRAPHICS d
	INNER JOIN 
		CountyStage c ON d.County_FIPS_Code = c.County_FIPS_Code AND d.State_FIPS_Code = c.State_FIPS_Code;

		-- Inserts poverty data in demographic table
	INSERT INTO DemographicStatisticsStage (Value, Min_value, Max_value, County_ID, Category_ID)
	SELECT 
		CAST(d.Poverty AS DECIMAL),
		d.Min_Poverty,
		d.Max_Poverty,
		c.County_ID,
		3 AS Category_ID -- category id for poverty
	FROM 
		DEMOGRAPHICS d
	INNER JOIN 
		CountyStage c ON d.County_FIPS_Code = c.County_FIPS_Code AND d.State_FIPS_Code = c.State_FIPS_Code;

	-- Inserts age distribution data for age 19 and under in demographic table
	INSERT INTO DemographicStatisticsStage (Value, Min_value, Max_value, County_ID, Category_ID, AgeGroup_ID)
	SELECT 
		CAST(d.Age_19_Under AS DECIMAL),
		d.Min_Age_19_Under,
		d.Max_Age_19_Under,
		c.County_ID,
		7 AS Category_ID, -- category ID for Age distribution
		7 AS AgeGroup_ID -- age group ID for 19 and under
	FROM 
		DEMOGRAPHICS d
	INNER JOIN 
		CountyStage c ON d.County_FIPS_Code = c.County_FIPS_Code AND d.State_FIPS_Code = c.State_FIPS_Code;

	-- Inserts age distribution data for age 19 to 64 in demographic table
	INSERT INTO DemographicStatisticsStage (Value, Min_value, Max_value, County_ID, Category_ID, AgeGroup_ID)
	SELECT 
		CAST(d.Age_19_64 AS DECIMAL),
		d.Min_Age_19_64,
		d.Max_Age_19_65,
		c.County_ID,
		7 AS Category_ID, -- category ID for Age distribution
		8 AS AgeGroup_ID -- age group ID for 19 to 64
	FROM 
		DEMOGRAPHICS d
	INNER JOIN 
		CountyStage c ON d.County_FIPS_Code = c.County_FIPS_Code AND d.State_FIPS_Code = c.State_FIPS_Code;

	-- Inserts age distribution data for age 65 to 84 in demographic table
	INSERT INTO DemographicStatisticsStage (Value, Min_value, Max_value, County_ID, Category_ID, AgeGroup_ID)
	SELECT 
		CAST(d.Age_65_84 AS DECIMAL),
		d.Min_Age_65_84,
		d.Max_Age_65_85,
		c.County_ID,
		7 AS Category_ID, -- category ID for Age distribution
		9 AS AgeGroup_ID -- age group ID for 65 to 84
	FROM 
		DEMOGRAPHICS d
	INNER JOIN 
		CountyStage c ON d.County_FIPS_Code = c.County_FIPS_Code AND d.State_FIPS_Code = c.State_FIPS_Code;

	-- Inserts age distribution data for age 85 and over in demographic table
	INSERT INTO DemographicStatisticsStage (Value, Min_value, Max_value, County_ID, Category_ID, AgeGroup_ID)
	SELECT 
		CAST(d.Age_85_and_Over AS DECIMAL),
		d.Min_Age_85_and_Over,
		d.Max_Age_85_and_Over,
		c.County_ID,
		7 AS Category_ID, -- category ID for Age distribution
		10 AS AgeGroup_ID -- age group ID for 85 and over
	FROM 
		DEMOGRAPHICS d
	INNER JOIN 
		CountyStage c ON d.County_FIPS_Code = c.County_FIPS_Code AND d.State_FIPS_Code = c.State_FIPS_Code;

		-- Inserting race data for White individuals
	INSERT INTO DemographicStatisticsStage (Value, Min_value, Max_value, County_ID, Category_ID, Race_ID)
	SELECT 
		CAST(d.White AS DECIMAL),
		d.Min_White,
		d.Max_White,
		c.County_ID,
		8 AS Category_ID, -- category ID for Race/Ethnicity
		1 AS Race_ID -- Race ID for White
	FROM 
		DEMOGRAPHICS d
	INNER JOIN 
		CountyStage c ON d.County_FIPS_Code = c.County_FIPS_Code AND d.State_FIPS_Code = c.State_FIPS_Code;

	-- Inserting race data for Black or African American individuals
	INSERT INTO DemographicStatisticsStage (Value, Min_value, Max_value, County_ID, Category_ID, Race_ID)
	SELECT 
		CAST(d.Black AS DECIMAL),
		d.Min_Black,
		d.Max_Black,
		c.County_ID,
		8 AS Category_ID, -- category ID for Race/Ethnicity
		2 AS Race_ID -- Race ID for Black
	FROM 
		DEMOGRAPHICS d
	INNER JOIN 
		CountyStage c ON d.County_FIPS_Code = c.County_FIPS_Code AND d.State_FIPS_Code = c.State_FIPS_Code;

	-- Inserting race data for Native American individuals
	INSERT INTO DemographicStatisticsStage (Value, Min_value, Max_value, County_ID, Category_ID, Race_ID)
	SELECT 
		CAST(d.Native_American AS DECIMAL),
		d.Min_Native_American,
		d.Max_Native_American,
		c.County_ID,
		8 AS Category_ID, -- category ID for Race/Ethnicity
		3 AS Race_ID -- Race ID for Native American
	FROM 
		DEMOGRAPHICS d
	INNER JOIN 
		CountyStage c ON d.County_FIPS_Code = c.County_FIPS_Code AND d.State_FIPS_Code = c.State_FIPS_Code;

	-- Inserting race data for Asian individuals
	INSERT INTO DemographicStatisticsStage (Value, Min_value, Max_value, County_ID, Category_ID, Race_ID)
	SELECT 
		CAST(d.Asian AS DECIMAL),
		d.Min_Asian,
		d.Max_Asian, 
		c.County_ID,
		8 AS Category_ID, -- category ID for Race/Ethnicity
		4 AS Race_ID -- Race ID for Asian
	FROM 
		DEMOGRAPHICS d
	INNER JOIN 
		CountyStage c ON d.County_FIPS_Code = c.County_FIPS_Code AND d.State_FIPS_Code = c.State_FIPS_Code;

	-- Inserting race data for Hispanic or Latino individuals
	INSERT INTO DemographicStatisticsStage (Value, Min_value, Max_value, County_ID, Category_ID, Race_ID)
	SELECT 
		TRY_CAST(NULLIF(d.Hispanic, 'Non-Numeric Value') AS DECIMAL),
		d.Min_Hispanic,
		TRY_CAST(NULLIF(d.Max_Hispanic, 'Non-Numeric Value') AS DECIMAL),
		c.County_ID,
		8 AS Category_ID, -- category ID for Race/Ethnicity
		5 AS Race_ID -- Race ID for Hispanic
	FROM 
		DEMOGRAPHICS d
	INNER JOIN 
		CountyStage c ON d.County_FIPS_Code = c.County_FIPS_Code AND d.State_FIPS_Code = c.State_FIPS_Code;

END

