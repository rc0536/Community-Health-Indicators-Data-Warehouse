SELECT
    s.CHSI_State_Name,
    s.CHSI_State_Abbr,
    AVG(ds.Value) AS Average_Poverty_Value
FROM
    State s
JOIN
    County c ON s.State_FIPS_Code = c.State_FIPS_Code
JOIN
    DemographicStatistics ds ON c.County_ID = ds.County_ID
WHERE
    ds.Category_ID = 3
GROUP BY
    s.CHSI_State_Name,
    s.CHSI_State_Abbr
ORDER BY
    Average_Poverty_Value DESC;

