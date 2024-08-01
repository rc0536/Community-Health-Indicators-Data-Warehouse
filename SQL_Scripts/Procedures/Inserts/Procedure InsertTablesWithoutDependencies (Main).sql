CREATE OR ALTER PROCEDURE InsertTablesWithoutDependencies
AS
BEGIN
		-- Insert StateStage data
	INSERT INTO State (State_FIPS_Code, CHSI_State_Name, CHSI_State_Abbr)
	SELECT State_FIPS_Code, CHSI_State_Name, CHSI_State_Abbr
	FROM HealthDataStaging.dbo.StateStage;

	-- Insert Categories data
	INSERT INTO Categories (Category_ID, Category_Name, Description)
	SELECT Category_ID, Category_Name, Description
	FROM healthDataStaging.dbo.CategoriesStage;

	-- Insert Race data
	INSERT INTO Race (Race_ID, Race_Name, Description)
	SELECT Race_ID, Race_Name, Description
	FROM healthDataStaging.dbo.RaceStage;

	-- Insert AgeGroup data
	INSERT INTO AgeGroup (AgeGroup_ID, Age_Group, Description)
	SELECT AgeGroup_ID, Age_Group, Description
	FROM healthDataStaging.dbo.AgeGroupStage;

	-- Insert CauseOfDeath data
	INSERT INTO CauseOfDeath (CauseOfDeath_ID, Name, Description)
	SELECT CauseOfDeath_ID, Name, Description
	FROM healthDataStaging.dbo.CauseOfDeathStage;

	-- Insert Strata data
	INSERT INTO Strata (Strata_ID_Number, Strata_Determining_Factors)
	SELECT Strata_ID_Number, Strata_Determining_Factors
	FROM healthDataStaging.dbo.StrataStage;

	-- Insert LifestyleRiskFactors data
	INSERT INTO LifestyleRiskFactors (LifestyleRiskFactor_ID, Name, Description)
	SELECT LifestyleRiskFactor_ID, Name, Description
	FROM healthDataStaging.dbo.LifestyleRiskFactorsStage;

	-- Insert LCD_Time_Span data
	INSERT INTO LCD_Time_SpanStage (ID, Time_Span)
	SELECT ID, Time_Span
	FROM healthDataStaging.dbo.LCD_Time_SpanStage;

END
