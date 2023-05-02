declare global {
  namespace NodeJS {
    interface ProcessEnv {
      NEO4J_URI: string;
      NEO4J_USER_NAME: string;
      NEO4J_PASSWORD: string;
    }
  }
}

export {}
