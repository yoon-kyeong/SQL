WITH RECURSIVE Generations AS (
    SELECT ID, 1 AS generation
    FROM ECOLI_DATA
    WHERE PARENT_ID IS NULL

    UNION ALL

    SELECT E.ID, G.generation + 1
    FROM ECOLI_DATA E
    JOIN Generations G ON E.PARENT_ID = G.ID
),
NoChildren AS (
    SELECT G.ID, G.generation
    FROM Generations G
    LEFT JOIN ECOLI_DATA E ON G.ID = E.PARENT_ID
    WHERE E.ID IS NULL
)

SELECT COUNT(*) AS count, generation
FROM NoChildren
GROUP BY generation
ORDER BY generation;
