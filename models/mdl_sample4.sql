SELECT
  e.*,
  CASE
    WHEN sal >= 1000 THEN 'high'
    WHEN sal >= 500 THEN 'medium'
    ELSE 'low'
  END as spending_segment
FROM {{ ref('kailashh') }} e

--syntax error line 9 at position 2 unexpected 'CASE'....so ,