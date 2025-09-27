// statistics 002 - size prevalence
MATCH (n:String)
WITH size(n.components) AS size, count(*) AS occurences
RETURN size, occurences, toInteger((2 ^ (size - 1))) AS `out of`
ORDER BY size ASC