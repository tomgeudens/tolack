// rule 004
MATCH (string:String)
CALL (string) {
    UNWIND range(0,size(string.components) - 2, 1) AS start
    WITH string, start
    WHERE ["U","U"] = string.components[start..start + 2]
    CALL (string, start) {
        WITH string, string.components[0..start] + string.components[start + 2 ..] AS newcomponents
        WITH string, reduce(result="", character in newcomponents | result + character) AS newid, newcomponents
        WHERE NOT EXISTS {MATCH (:String {id: newid})}
        CREATE (string)<-[:DERIVED_FROM {rule: 4}]-(:String {id: newid, components: newcomponents})        
    }
}
RETURN count(*);