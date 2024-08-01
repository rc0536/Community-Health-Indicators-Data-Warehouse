CREATE OR ALTER PROCEDURE CreateTables
AS
BEGIN
    SET NOCOUNT ON;

	-- Drop tables with dependencies first in reverse order
	DROP TABLE IF EXISTS DeathMeasuresStatistics;
	DROP TABLE IF EXISTS RiskFactorStatistics;
	DROP TABLE IF EXISTS DemographicStatistics;
	DROP TABLE IF EXISTS County;

	-- Then, drop tables without dependencies
	DROP TABLE IF EXISTS LCD_Time_SpanStage;
	DROP TABLE IF EXISTS LifestyleRiskFactors;
	DROP TABLE IF EXISTS Strata;
	DROP TABLE IF EXISTS CauseOfDeath;
	DROP TABLE IF EXISTS AgeGroup;
	DROP TABLE IF EXISTS Race;
	DROP TABLE IF EXISTS Categories;
	DROP TABLE IF EXISTS State;

	-- Now, create tables without dependencies
	CREATE TABLE State (
		State_FIPS_Code INT PRIMARY KEY,
		CHSI_State_Name VARCHAR(255),
		CHSI_State_Abbr VARCHAR(10)
	);
	CREATE TABLE Categories (
		Category_ID INT PRIMARY KEY,
		Category_Name VARCHAR(255),
		Description VARCHAR(255)
	);
	CREATE TABLE Race(
		Race_ID INT PRIMARY KEY,
		Race_Name VARCHAR(255),
		Description VARCHAR(255)
	);
	CREATE TABLE AgeGroup(
		AgeGroup_ID INT PRIMARY KEY,
		Age_Group VARCHAR(50),
		Description VARCHAR(255)
	);
	CREATE TABLE CauseOfDeath (
		CauseOfDeath_ID INT PRIMARY KEY,
		Name VARCHAR(255),
		Description VARCHAR(1024)
	);
	CREATE TABLE Strata (
		Strata_ID_Number INT PRIMARY KEY,
		Strata_Determining_Factors VARCHAR(255)
	);
	CREATE TABLE LifestyleRiskFactors (
		LifestyleRiskFactor_ID INT PRIMARY KEY,
		Name VARCHAR(255),
		Description VARCHAR(1024)
	);
	CREATE TABLE LCD_Time_SpanStage (
		ID INT IDENTITY(1,1) PRIMARY KEY,
		Time_Span VARCHAR(255) UNIQUE
	);

	-- Then create tables with dependencies
	CREATE TABLE County (
		County_ID INT PRIMARY KEY,
		County_FIPS_Code INT,
		CHSI_County_Name VARCHAR(255),
		State_FIPS_Code INT REFERENCES State(State_FIPS_Code)
	);
	CREATE TABLE DemographicStatistics (
		Demo_Statistic_ID INT PRIMARY KEY,
		Value DECIMAL NULL,
		Min_value DECIMAL(10, 2) NULL,
		Max_value  DECIMAL(10, 2) NULL,
		Race_ID INT NULL REFERENCES Race(Race_ID),
		AgeGroup_ID INT NULL REFERENCES AgeGroup(AgeGroup_ID),
		County_ID INT REFERENCES County(County_ID),
		Category_ID INT REFERENCES Categories(Category_ID)
	);
	CREATE TABLE RiskFactorStatistics(
		RiskFactor_ID INT PRIMARY KEY,
		Value DECIMAL(10, 2) NULL,
		CI_Min DECIMAL(10, 2) NULL,
		CI_Max DECIMAL(10, 2) NULL,
		County_ID INT REFERENCES County(County_ID),
		Category_ID INT REFERENCES Categories(Category_ID),
		LifestyleRiskFactor_ID INT REFERENCES LifestyleRiskFactors(LifestyleRiskFactor_ID)
	);
	CREATE TABLE DeathMeasuresStatistics (
		Death_Statistic_ID INT PRIMARY KEY,
		Value DECIMAL NULL,
		CI_Min_value DECIMAL(10, 2) NULL,
		CI_Max_value  DECIMAL(10, 2) NULL,
		Race_ID INT NULL REFERENCES Race(Race_ID),
		County_ID INT REFERENCES County(County_ID),
		Category_ID INT REFERENCES Categories(Category_ID),
		CauseOfDeath_ID INT REFERENCES CauseOfDeath(CauseOfDeath_ID)
	);

	-- fact Tables
	Drop table if exists RaceStats;
	CREATE TABLE RaceStats (
		Race_ID INT,
		Category_ID INT,
		County_ID INT,
		Value DECIMAL(10, 2),
		Min_value DECIMAL(10, 2),
		Max_value DECIMAL(10, 2),
		Average_value DECIMAL(10, 2), -- Computed as an additional column
		Value_count INT,               -- To store the number of values that were aggregated
		Created_at TIMESTAMP,          -- To know when the record was added        
		PRIMARY KEY (Race_ID, Category_ID, County_ID),
		FOREIGN KEY (Race_ID) REFERENCES Race(Race_ID),
		FOREIGN KEY (Category_ID) REFERENCES Categories(Category_ID),
		FOREIGN KEY (County_ID) REFERENCES County(County_ID)
	);

	Drop table if exists DemographicRiskAnalysis;
	CREATE TABLE DemographicRiskAnalysis (
    Analysis_ID INT IDENTITY(1,1) PRIMARY KEY,
    State_FIPS_Code INT,
    County_ID INT,
    AgeGroup_ID INT,
    LifestyleRiskFactor_ID INT,
    Average_RiskFactor_Value DECIMAL(10, 2),
    Total_Population INT,
    Affected_Population INT,
    Percentage_Affected DECIMAL(5, 2),
    Created_at DATETIME DEFAULT GETDATE(),
    Updated_at DATETIME,
    FOREIGN KEY (State_FIPS_Code) REFERENCES State(State_FIPS_Code),
    FOREIGN KEY (County_ID) REFERENCES County(County_ID),
    FOREIGN KEY (AgeGroup_ID) REFERENCES AgeGroup(AgeGroup_ID),
    FOREIGN KEY (LifestyleRiskFactor_ID) REFERENCES LifestyleRiskFactors(LifestyleRiskFactor_ID)
);

END


