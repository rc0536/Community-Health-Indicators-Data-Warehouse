WITH Statewise_Death_And_Risk AS (
    SELECT
        s.CHSI_State_Name,
        AVG(dms.Value) AS Average_Death_Value,
        AVG(CASE WHEN rfs.LifestyleRiskFactor_ID = 1 THEN rfs.Value ELSE NULL END) AS Average_No_Exercise_Value
    FROM
        State s
    JOIN
        County c ON s.State_FIPS_Code = c.State_FIPS_Code
    LEFT JOIN
        DeathMeasuresStatistics dms ON c.County_ID = dms.County_ID
    LEFT JOIN
        RiskFactorStatistics rfs ON c.County_ID = rfs.County_ID AND rfs.LifestyleRiskFactor_ID = 1
    GROUP BY
        s.CHSI_State_Name
)
SELECT
    CHSI_State_Name,
    Average_Death_Value,
    Average_No_Exercise_Value
FROM
    Statewise_Death_And_Risk
ORDER BY
    Average_Death_Value DESC;
