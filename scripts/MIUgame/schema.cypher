// schema
CREATE CONSTRAINT uniqueStringid IF NOT EXISTS FOR (s:String) REQUIRE (s.id) IS UNIQUE;