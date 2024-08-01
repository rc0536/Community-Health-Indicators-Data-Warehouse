SELECT
    County.CHSI_County_Name AS CountyName,
    Race.Race_Name AS Demographic,
    'Race' AS DemographicType,
    AVG(DemographicStatistics.Value) AS AverageDemoValue,
    CauseOfDeath.Name AS CauseOfDeath,
    AVG(DeathMeasuresStatistics.Value) AS AverageDeathValue,
    LifestyleRiskFactors.Name AS LifestyleRiskFactor,
    AVG(RiskFactorStatistics.Value) AS AverageRiskFactorValue
FROM County
JOIN DemographicStatistics ON County.County_ID = DemographicStatistics.County_ID AND DemographicStatistics.Race_ID IS NOT NULL
JOIN Race ON DemographicStatistics.Race_ID = Race.Race_ID
LEFT JOIN DeathMeasuresStatistics ON County.County_ID = DeathMeasuresStatistics.County_ID
LEFT JOIN CauseOfDeath ON DeathMeasuresStatistics.CauseOfDeath_ID = CauseOfDeath.CauseOfDeath_ID
LEFT JOIN RiskFactorStatistics ON County.County_ID = RiskFactorStatistics.County_ID
LEFT JOIN LifestyleRiskFactors ON RiskFactorStatistics.LifestyleRiskFactor_ID = LifestyleRiskFactors.LifestyleRiskFactor_ID
WHERE County.CHSI_County_Name = 'Baldwin'
GROUP BY County.CHSI_County_Name, Race.Race_Name, CauseOfDeath.Name, LifestyleRiskFactors.Name
ORDER BY Demographic, CauseOfDeath, LifestyleRiskFactor;


SELECT
    County.CHSI_County_Name AS CountyName,
    AgeGroup.Age_Group AS Demographic,
    'Age Group' AS DemographicType,
    AVG(DemographicStatistics.Value) AS AverageDemoValue,
    CauseOfDeath.Name AS CauseOfDeath,
    AVG(DeathMeasuresStatistics.Value) AS AverageDeathValue,
    LifestyleRiskFactors.Name AS LifestyleRiskFactor,
    AVG(RiskFactorStatistics.Value) AS AverageRiskFactorValue
FROM County
JOIN DemographicStatistics ON County.County_ID = DemographicStatistics.County_ID AND DemographicStatistics.AgeGroup_ID IS NOT NULL
JOIN AgeGroup ON DemographicStatistics.AgeGroup_ID = AgeGroup.AgeGroup_ID
LEFT JOIN DeathMeasuresStatistics ON County.County_ID = DeathMeasuresStatistics.County_ID
LEFT JOIN CauseOfDeath ON DeathMeasuresStatistics.CauseOfDeath_ID = CauseOfDeath.CauseOfDeath_ID
LEFT JOIN RiskFactorStatistics ON County.County_ID = RiskFactorStatistics.County_ID
LEFT JOIN LifestyleRiskFactors ON RiskFactorStatistics.LifestyleRiskFactor_ID = LifestyleRiskFactors.LifestyleRiskFactor_ID
WHERE County.CHSI_County_Name = 'Baldwin'
GROUP BY County.CHSI_County_Name, AgeGroup.Age_Group, CauseOfDeath.Name, LifestyleRiskFactors.Name
ORDER BY Demographic, CauseOfDeath, LifestyleRiskFactor;
