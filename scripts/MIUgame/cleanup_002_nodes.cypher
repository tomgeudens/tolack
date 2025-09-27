// cleanup 002 - nodes
CALL apoc.periodic.commit(
  "MATCH (n) WITH n LIMIT $limit DELETE n RETURN count(*)",
  {limit:2000}
);