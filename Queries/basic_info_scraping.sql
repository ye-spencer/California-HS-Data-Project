SELECT
  `School Code`,
  `Student Teacher Ratio`,
  Type
FROM (
  SELECT 
    RIGHT(`State School ID`, 7) AS `School Code`, 
    RIGHT(`State District ID`, 7) AS `District Code`,
    `Student Teacher Ratio`,
    Type
  FROM 
    `california-hs-project.Main.School Basic Info`
) subquery
WHERE
  NOT `School Code` = `District Code`
  AND NOT `Student Teacher Ratio` = "?";

