// cleanup 001 - relationships
CALL apoc.periodic.commit(
  "MATCH ()-[r]->() WITH r LIMIT $limit DELETE r RETURN count(*)",
  {limit:2000}
);