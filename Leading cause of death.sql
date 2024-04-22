WITH Statewise_Death_Causes AS (
    SELECT
        s.CHSI_State_Name,
        s.CHSI_State_Abbr,
        cod.Name AS Cause_Of_Death,
        SUM(dms.Value) AS Total_Deaths
    FROM
        State s
    JOIN
        County c ON s.State_FIPS_Code = c.State_FIPS_Code
    JOIN
        DeathMeasuresStatistics dms ON c.County_ID = dms.County_ID
    JOIN
        CauseOfDeath cod ON dms.CauseOfDeath_ID = cod.CauseOfDeath_ID
    GROUP BY
        s.CHSI_State_Name,
        s.CHSI_State_Abbr,
        cod.Name
),
Ranked_Death_Causes AS (
    SELECT
        *,
        RANK() OVER (PARTITION BY CHSI_State_Name ORDER BY Total_Deaths DESC) AS Rank
    FROM
        Statewise_Death_Causes
)
SELECT
    CHSI_State_Name,
    CHSI_State_Abbr,
    Cause_Of_Death,
    Total_Deaths
FROM
    Ranked_Death_Causes
WHERE
    Rank = 1;
