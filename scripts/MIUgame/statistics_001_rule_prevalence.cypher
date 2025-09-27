// statistics 001 - rule prevalence
MATCH ()-[df:DERIVED_FROM]->()
RETURN df.rule AS rule, count(*) AS occurences
ORDER BY rule ASC