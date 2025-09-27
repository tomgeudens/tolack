// rule 003
MATCH (string:String)
CALL (string) {
    UNWIND range(0,size(string.components) - 3, 1) AS start
    WITH string, start
    WHERE ["I","I","I"] = string.components[start..start + 3]
    CALL (string, start) {
        WITH string, string.components[0..start] + "U" + string.components[start + 3 ..] AS newcomponents
        WITH string, reduce(result="", character in newcomponents | result + character) AS newid, newcomponents
        WHERE NOT EXISTS {MATCH (:String {id: newid})}
        CREATE (string)<-[:DERIVED_FROM {rule: 3}]-(:String {id: newid, components: newcomponents})        
    }
}
RETURN count(*);