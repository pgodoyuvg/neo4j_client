import neo4j from 'neo4j-driver';

export const driver = neo4j.driver(
  process.env.NEO4J_URI as string,
  neo4j.auth.basic(
    process.env.NEO4J_USER_NAME as string,
    process.env.NEO4J_PASSWORD as string
  )
);
