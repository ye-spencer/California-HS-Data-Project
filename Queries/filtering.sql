SELECT
  `School Code`,
  `County Code`,
  `District Code`,
  `Students Tested`,
  (10 * `Percentage Standard Exceeded` + 7 * `Percentage Standard Met` + 2 * `Percentage Standard Nearly Met` + 0.5 * `Percentage Standard Not Met`) AS score
FROM (
SELECT 
  `School Code`, 
  `County Code`,
  `District Code`,
  SUM(CAST(`Students Tested` AS INT64)) AS `Students Tested`,
  AVG(CAST(`Mean Scale Score` AS FLOAT64)) AS `Mean Scale Score`,
  AVG(CAST(`Percentage Standard Exceeded` AS FLOAT64)) AS `Percentage Standard Exceeded`,
  AVG(CAST(`Percentage Standard Met` AS FLOAT64)) AS `Percentage Standard Met`,
  AVG(CAST(`Percentage Standard Nearly Met` AS FLOAT64)) AS `Percentage Standard Nearly Met`,
  AVG(CAST(`Percentage Standard Not Met` AS FLOAT64)) AS `Percentage Standard Not Met`
FROM `california-hs-project.Main.Testing Data`
WHERE grade = 11
  AND (NOT `School Code` = 0)
  AND (NOT `Students Tested` = "*")
  AND (NOT `Percentage Standard Exceeded` = "*")
GROUP BY `School Code`, `County Code`, `District Code`;
) subquery
  

