export {};

declare global {
  // Declare types for the bindings: KV Namespace, Environment variables... here
  const COPY_CLIP_KV: KVNamespace;
  // Environment variables
  const GRAPHQL_BASE_ENDPOINT: string;
  const GRAPHQL_PLAYGROUND_ENDPOINT: string;

  // const APPMAKER_ACCESS: string;
}
