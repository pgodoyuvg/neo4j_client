CREATE (u:User { name: "@palvarez" })-[r:ASSIGNED]->(c:Course { name: "Algoritmos y Estructuras de Datos", class: 30 })
RETURN u, r, c

MATCH (c:Course)
WHERE c.name = 'Algoritmos y Estructuras de Datos' AND c.class = 30
CREATE (:User { name: "@ebarrera" })-[:ASSIGNED]->(c), (:User { name: "@abhor" })-[:ASSIGNED]->(c), (:User { name: "@rchuy" })-[:ASSIGNED]->(c), (:User { name: "@adonis" })-[r:ASSIGNED]->(c)
RETURN c

MATCH (c:Course)
WHERE c.name = 'Algoritmos y Estructuras de Datos' AND c.class = 30
CREATE (:User { name: "@rgonzalez" })-[:ASSIGNED]->(c), (:User { name: "@jgramajo" })-[:ASSIGNED]->(c), (:User { name: "@cguevara" })-[:ASSIGNED]->(c), (:User { name: "@sillescas" })-[:ASSIGNED]->(c),
(:User { name: "@allarena" })-[:ASSIGNED]->(c), (:User { name: "@olopez" })-[:ASSIGNED]->(c), (:User { name: "@jlopez" })-[:ASSIGNED]->(c), (:User { name: "@cmadrid" })-[:ASSIGNED]->(c),
(:User { name: "@mmaldonado" })-[:ASSIGNED]->(c), (:User { name: "@emata" })-[:ASSIGNED]->(c), (:User { name: "@mmejia" })-[:ASSIGNED]->(c), (:User { name: "@imorales" })-[:ASSIGNED]->(c),
(:User { name: "@pnoak" })-[:ASSIGNED]->(c), (:User { name: "@spalacios" })-[:ASSIGNED]->(c), (:User { name: "@arecinos" })-[:ASSIGNED]->(c), (:User { name: "@droldan" })-[:ASSIGNED]->(c),
(:User { name: "@dvasquez" })-[:ASSIGNED]->(c)
RETURN c

MATCH (c:Course)
WHERE c.name = 'Algoritmos y Estructuras de Datos' AND c.class = 30
CREATE (c)-[r:EVALUATES]->(t:Topic { name: "BST", description: "Binary Search Trees" })
return c

MATCH (u:User { name: "@palvarez" })-[:ASSIGNED]->(:Course)--(t:Topic)
RETURN t.name

MATCH (c:Course) WHERE c.name = 'Algoritmos y Estructuras de Datos' and c.class = 30
CREATE (u:User { name: '@pgodoy', teacher: true })-[r:TEACHES]->(c)
RETURN u,r,c