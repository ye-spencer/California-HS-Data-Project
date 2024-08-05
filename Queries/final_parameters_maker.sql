SELECT 
  d1.`School Code`,
  d1.Score,
  d1.`Students Tested`,
  d2.`Student Teacher Ratio`,
  d2.Type
FROM 
  `california-hs-project.Processed_Data.Scores Filtered` as d1 
  INNER JOIN `california-hs-project.Processed_Data.S-T Ratio and Type` as d2
  ON d1.`School Code` = d2.`School Code`;
