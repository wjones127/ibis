SELECT
  t0.`x` IN (
    SELECT
      t1.`x`
    FROM (
      SELECT
        t0.*
      FROM t AS t0
      WHERE
        t0.`x` > 2
    ) AS t1
  ) AS `tmp`
FROM t AS t0