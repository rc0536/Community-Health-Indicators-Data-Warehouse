CREATE OR ALTER PROCEDURE InsertFactTables
AS
BEGIN
	-- Insert values into RaceStats from DemographicStatistics and DeathMeasuresStatistics
INSERT INTO RaceStats (Race_ID, Category_ID, County_ID, Value, Min_value, Max_value)
SELECT
    Race_ID,
    Category_ID,
    County_ID,
    SUM(Value) AS Total_Value,
    MIN(Value) AS Min_Value,
    MAX(Value) AS Max_Value
FROM (
    SELECT Race_ID, Category_ID, County_ID, Value FROM DemographicStatistics
    WHERE Race_ID IS NOT NULL
    UNION ALL
    SELECT Race_ID, Category_ID, County_ID, Value FROM DeathMeasuresStatistics
    WHERE Race_ID IS NOT NULL
) AS StatsWithRace
GROUP BY Race_ID, Category_ID, County_ID;

INSERT INTO DemographicRiskAnalysis (
    State_FIPS_Code,
    County_ID,
    AgeGroup_ID,
    LifestyleRiskFactor_ID,
    Average_RiskFactor_Value,
    Total_Population,
    Affected_Population,
    Percentage_Affected,
    Updated_at
)
SELECT
    c.State_FIPS_Code,
    rf.County_ID,
    d.AgeGroup_ID,
    rf.LifestyleRiskFactor_ID,
    AVG(rf.Value) AS Average_RiskFactor_Value,
    SUM(d.Value) AS Total_Population, -- This assumes d.Value represents population count
    COUNT(rf.Value) AS Affected_Population, -- This assumes each record in RiskFactorStatistics represents an affected individual
    (COUNT(rf.Value) / SUM(d.Value) * 100) AS Percentage_Affected, -- Calculates the percentage
    GETDATE() AS Updated_at
FROM
    RiskFactorStatistics rf
INNER JOIN County c ON rf.County_ID = c.County_ID
LEFT JOIN DemographicStatistics d ON rf.County_ID = d.County_ID AND rf.Category_ID = d.Category_ID -- This assumes that there is a logical link between these tables
GROUP BY
    c.State_FIPS_Code,
    rf.County_ID,
    d.AgeGroup_ID,
    rf.LifestyleRiskFactor_ID;
END