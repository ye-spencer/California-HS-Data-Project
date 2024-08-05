SELECT
  `School Code`,
  `County Code`,
  `District Code`,
  `Students Tested`,
  CAST(10 * `Percentage Standard Exceeded` + 7 * `Percentage Standard Met` + 2 * `Percentage Standard Nearly Met` + 0.5 * `Percentage Standard Not Met` AS FLOAT64) AS score
FROM ( -- Subquery to combine school's various scores across test versions
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
WHERE grade = 11 -- Only get the scores for individual schools, no aggregated scores or missing scores
  AND (NOT `School Code` = 0)
  AND (NOT `Students Tested` = "*")
  AND (NOT `Percentage Standard Exceeded` = "*")
GROUP BY `School Code`, `County Code`, `District Code`;
) subquery

-- Need to run a loop to see which power of n (school size) we should divide the schools by to minimize school size as a factor
  

