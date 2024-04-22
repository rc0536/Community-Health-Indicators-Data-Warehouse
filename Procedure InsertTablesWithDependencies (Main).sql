
CREATE OR ALTER PROCEDURE InsertTablesWithDependencies
AS
BEGIN
	-- Insert County data
	INSERT INTO County (County_ID, County_FIPS_Code, CHSI_County_Name, State_FIPS_Code)
	SELECT County_ID, County_FIPS_Code, CHSI_County_Name, State_FIPS_Code
	FROM healthDataStaging.dbo.CountyStage;

	-- Insert DemographicStatistics data
	INSERT INTO DemographicStatistics (Demo_Statistic_ID, Value, Min_value, Max_value, Race_ID, AgeGroup_ID, County_ID, Category_ID)
	SELECT Demo_Statistic_ID, Value, Min_value, Max_value, Race_ID, AgeGroup_ID, County_ID, Category_ID
	FROM healthDataStaging.dbo.DemographicStatisticsStage;

	-- Insert RiskFactorStatistics data
	INSERT INTO RiskFactorStatistics (RiskFactor_ID, Value, CI_Min, CI_Max, County_ID, Category_ID, LifestyleRiskFactor_ID)
	SELECT RiskFactor_ID, Value, CI_Min, CI_Max, County_ID, Category_ID, LifestyleRiskFactor_ID
	FROM healthDataStaging.dbo.RiskFactorStatisticsStage;

	-- Insert DeathMeasuresStatistics data
	INSERT INTO DeathMeasuresStatistics (Death_Statistic_ID, Value, CI_Min_value, CI_Max_value, Race_ID, County_ID, Category_ID, CauseOfDeath_ID)
	SELECT Death_Statistic_ID, Value, CI_Min_value, CI_Max_value, Race_ID, County_ID, Category_ID, CauseOfDeath_ID
	FROM healthDataStaging.dbo.DeathMeasuresStatisticsStage;

END




	


