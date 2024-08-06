SELECT 
  (MOD(CAST(CDS_CODE AS INT64), 1000000)) AS `School Code`,
  HISPANIC / TOTAL AS `percent hispanic`,
  AM_IND / TOTAL AS `percent native american`,
  ASIAN / TOTAL  AS `percent asian`,
  PAC_ISLD / TOTAL AS `percent pacific island`,
  FILIPINO  / TOTAL AS `percent filipino`,
  AFRICAN_AM / TOTAL AS `percent black`,
  WHITE / TOTAL AS `percent white`,
  TWO_MORE_RACES / TOTAL AS `percent mixed`,
  TOTAL AS `total`,
FROM `california-hs-project.Main.Graduation CSU-UC Data`
WHERE 
  NOT TOTAL = 0