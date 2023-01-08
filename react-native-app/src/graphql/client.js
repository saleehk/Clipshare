import { ApolloClient, InMemoryCache } from '@apollo/client';

const client = new ApolloClient({
  uri: 'https://2ef4fbafb4.to.intercept.rest/',
//   uri: 'https://2ef4fbafb4.to.intercept.rest/',
  cache: new InMemoryCache(),
});

export { client };
