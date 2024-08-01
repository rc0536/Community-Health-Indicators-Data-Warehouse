CREATE OR ALTER PROCEDURE CreateStagingTables
AS
BEGIN
    SET NOCOUNT ON;

	-- State Table
	DROP TABLE IF EXISTS StateStage;
	CREATE TABLE StateStage (
		State_FIPS_Code INT PRIMARY KEY,
		CHSI_State_Name VARCHAR(255),
		CHSI_State_Abbr VARCHAR(10)
	);

	-- County Table
	DROP TABLE IF EXISTS CountyStage;
	CREATE TABLE CountyStage (
		County_ID INT IDENTITY(1,1) PRIMARY KEY,
		County_FIPS_Code INT,
		CHSI_County_Name VARCHAR(255),
		State_FIPS_Code INT 
		--REFERENCES StateStage(State_FIPS_Code) -- Added foreign key reference
	);

	-- Statistic Categories Table
	DROP TABLE IF EXISTS CategoriesStage;
	CREATE TABLE CategoriesStage (
		Category_ID INT IDENTITY(1,1) PRIMARY KEY,
		Category_Name VARCHAR(255),
		Description VARCHAR(255),
	);

	-- Race Table
	DROP TABLE IF EXISTS RaceStage;
	CREATE TABLE RaceStage (
		Race_ID INT IDENTITY(1,1) PRIMARY KEY,
		Race_Name VARCHAR(255),
		Description VARCHAR(255)
	);

	-- Age Group Table
	DROP TABLE IF EXISTS AgeGroupStage;
	CREATE TABLE AgeGroupStage (
		AgeGroup_ID INT IDENTITY(1,1) PRIMARY KEY,
		Age_Group VARCHAR(50),
		Description VARCHAR(255)
	);

	-- DemographicStatisticsStage Table
	DROP TABLE IF EXISTS DemographicStatisticsStage;
	CREATE TABLE DemographicStatisticsStage (
		Demo_Statistic_ID INT IDENTITY(1,1) PRIMARY KEY,
		Value DECIMAL NULL,
		Min_value DECIMAL(10, 2) NULL,
		Max_value  DECIMAL(10, 2) NULL,
		Race_ID INT NULL,
		AgeGroup_ID INT NULL,
		County_ID INT,
		Category_ID INT
		--FOREIGN KEY (County_ID) REFERENCES CountyStage (County_ID),
		--FOREIGN KEY (AgeGroup_ID) REFERENCES AgeGroupStage(AgeGroup_ID),
		--FOREIGN KEY (Race_ID) REFERENCES RaceStage(Race_ID)
		--FOREIGN KEY (Category_ID) REFERENCES CategoriesStage(Category_ID)
	);

	-- Age Group Table
	DROP TABLE IF EXISTS RiskFactorStatisticsStage;
	CREATE TABLE RiskFactorStatisticsStage (
		RiskFactor_ID INT IDENTITY(1,1) PRIMARY KEY,
		Value DECIMAL(10, 2) NULL,
		CI_Min DECIMAL(10, 2) NULL,
		CI_Max DECIMAL(10, 2) NULL,
		County_ID INT,
		Category_ID INT,
		LifestyleRiskFactor_ID INT
		--FOREIGN KEY (LifestyleRiskFactor_ID) REFERENCES LifestyleRiskFactorsStage (LifestyleRiskFactor_ID),
		--FOREIGN KEY (County_ID) REFERENCES CountyStage (County_ID),
		--FOREIGN KEY (Category_ID) REFERENCES CategoriesStage(Category_ID)
	);

	-- Age Group Table
	DROP TABLE IF EXISTS BirthMeasuresStatisticsStage;
	CREATE TABLE BirthMeasuresStatisticsStage (
		Statistic_ID INT PRIMARY KEY,
		BirthMeasure_ID INT,
		Value DECIMAL(10, 2) NULL,
		Percentage DECIMAL(5, 2) NULL,
		CI_Min DECIMAL(10, 2) NULL,
		CI_Max DECIMAL(10, 2) NULL,
		--FOREIGN KEY (Statistic_ID) REFERENCES CoreStatisticsStage(Statistic_ID),
		--FOREIGN KEY (BirthMeasure_ID) REFERENCES BirthMeasuresStage(BirthMeasure_ID)
	);

	-- Age Group Table
	DROP TABLE IF EXISTS DeathMeasuresStatisticsStage;
	CREATE TABLE DeathMeasuresStatisticsStage (
		Death_Statistic_ID INT IDENTITY(1,1) PRIMARY KEY,
		Value DECIMAL NULL,
		CI_Min_value DECIMAL(10, 2) NULL,
		CI_Max_value  DECIMAL(10, 2) NULL,
		Race_ID INT NULL,
		County_ID INT,
		Category_ID INT,
		CauseOfDeath_ID INT
		--FOREIGN KEY (CauseOfDeath_ID) REFERENCES CauseOfDeathStage (CauseOfDeath_ID),
		--FOREIGN KEY (County_ID) REFERENCES CountyStage (County_ID),
		--FOREIGN KEY (Race_ID) REFERENCES RaceStage(Race_ID)
		--FOREIGN KEY (Category_ID) REFERENCES CategoriesStage(Category_ID)
	);


	-- Strata Table
	DROP TABLE IF EXISTS StrataStage;
	CREATE TABLE StrataStage (
		Strata_ID_Number INT PRIMARY KEY,
		Strata_Determining_Factors VARCHAR(255)
	);

	-- Health Indicators Table
	DROP TABLE IF EXISTS HealthIndicatorsStage;
	CREATE TABLE HealthIndicatorsStage (
		HealthIndicator_ID INT IDENTITY(1,1) PRIMARY KEY,
		Name VARCHAR(255),
		Description VARCHAR(1024),
		Is_Percent_Data BIT
	);

	-- Birth Measures Table
	DROP TABLE IF EXISTS BirthMeasuresStage;
	CREATE TABLE BirthMeasuresStage (
		BirthMeasure_ID INT IDENTITY(1,1) PRIMARY KEY,
		Name VARCHAR(255),
		Description VARCHAR(1024),
		Is_Favorable BIT
	);

	-- Death Measures Table
	DROP TABLE IF EXISTS CauseOfDeathStage;
	CREATE TABLE CauseOfDeathStage (
		CauseOfDeath_ID INT IDENTITY(1,1) PRIMARY KEY,
		Name VARCHAR(255),
		Description VARCHAR(1024),
	);

	-- Lifestyle Risk Factors Table
	DROP TABLE IF EXISTS LifestyleRiskFactorsStage;
	CREATE TABLE LifestyleRiskFactorsStage (
		LifestyleRiskFactor_ID INT IDENTITY(1,1) PRIMARY KEY,
		Name VARCHAR(255),
		Description VARCHAR(1024)
	);

	-- Healthcare Access Table
	DROP TABLE IF EXISTS HealthcareAccessStage;
	CREATE TABLE HealthcareAccessStage (
		HealthcareAccess_ID INT IDENTITY(1,1) PRIMARY KEY,
		Name VARCHAR(255),
		Description VARCHAR(1024)
	);

	-- Environmental Health Indicators Table
	DROP TABLE IF EXISTS EnvironmentalHealthIndicatorsStage;
	CREATE TABLE EnvironmentalHealthIndicatorsStage (
		EnvironmentalHealthIndicator_ID INT IDENTITY(1,1) PRIMARY KEY,
		Name VARCHAR(255),
		Description VARCHAR(1024),
		Is_Standard_Indicator BIT
	);

	-- Infectious Disease Reporting Table
	DROP TABLE IF EXISTS InfectiousDiseaseReportingStage;
	CREATE TABLE InfectiousDiseaseReportingStage (
		InfectiousDisease_ID INT IDENTITY(1,1) PRIMARY KEY,
		Name VARCHAR(255),
		Description VARCHAR(1024),
		Is_Favorable BIT
	);

	DROP TABLE IF EXISTS LCD_Time_SpanStage;
	CREATE TABLE LCD_Time_SpanStage (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Time_Span VARCHAR(255) UNIQUE
	);

END
GO

