WITH t0 AS (
  SELECT t2.`g`, t2.`a`, t2.`b`, sum(t2.`f`) AS `total`
  FROM alltypes t2
  GROUP BY 1, 2, 3
)
SELECT t0.`g`, max(t0.`total` - `total`) AS `metric`
FROM (
  SELECT t0.`g` AS `g_x`, t0.`a` AS `a_x`, t0.`b` AS `b_x`,
         t0.`total` AS `total_x`, t2.`g` AS `g_y`, t2.`a` AS `a_y`,
         t2.`b` AS `b_y`, t2.`total` AS `total_y`
  FROM t0
    INNER JOIN t0 t2
      ON t0.`a` = t2.`b`
) t1
GROUP BY 1