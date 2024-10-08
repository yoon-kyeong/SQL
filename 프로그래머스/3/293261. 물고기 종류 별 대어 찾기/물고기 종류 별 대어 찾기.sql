WITH MAX_LENGTH AS(
    SELECT FISH_TYPE, MAX(LENGTH) AS MAX_LENGTH
    FROM FISH_INFO
    GROUP BY FISH_TYPE
)

SELECT A.ID, B.FISH_NAME, A.LENGTH
FROM FISH_INFO A
JOIN MAX_LENGTH ML ON A.FISH_TYPE = ML.FISH_TYPE AND A.LENGTH = ML.MAX_LENGTH
LEFT JOIN FISH_NAME_INFO B ON A.FISH_TYPE = B.FISH_TYPE
ORDER BY A.ID;