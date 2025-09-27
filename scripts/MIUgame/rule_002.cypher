// rule 002
MATCH (string:String)
CALL (string) {
	WITH string, string.components + string.components[1..] AS newcomponents
	WITH string, reduce(result="", character in newcomponents | result + character) AS newid, newcomponents
	WITH string, newid, newcomponents
	WHERE NOT EXISTS {MATCH (:String {id: newid})}
	CREATE (string)<-[:DERIVED_FROM {rule: 2}]-(:String {id: newid, components: newcomponents})
}
RETURN count(*);