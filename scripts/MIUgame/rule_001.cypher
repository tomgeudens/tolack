// rule 001
MATCH (string:String)
CALL (string) {
	WITH string
	WHERE string.components[-1] = "I"
	WITH string, string.components + "U" AS newcomponents
	WITH string, reduce(result="", character in newcomponents | result + character) AS newid, newcomponents
	WITH string, newid, newcomponents
	WHERE NOT EXISTS {MATCH (:String {id: newid})}
	CREATE (string)<-[:DERIVED_FROM {rule: 1}]-(:String {id: newid, components: newcomponents})
}
RETURN count(*);
