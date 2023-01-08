import { ApolloClient, InMemoryCache } from '@apollo/client';

const client = new ApolloClient({
  uri: 'https://copy-link.saleeh.workers.dev/',
  cache: new InMemoryCache(),
});

export { client };
