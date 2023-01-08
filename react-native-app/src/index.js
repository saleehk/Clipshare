// In App.js in a new project

import * as React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { ApolloClient, InMemoryCache, ApolloProvider } from '@apollo/client';

import HomeScreen from './screens/HomeScreen';
import QRScanner from './screens/QRScanner';
import { client } from './graphql/client';
import NotificationHandler from './components/NotificationHandler';

const Stack = createNativeStackNavigator();

function App() {
  return (
    <ApolloProvider client={client}>
      <NotificationHandler />
      <NavigationContainer>
        <Stack.Navigator>
          <Stack.Screen name="QRScanner" component={QRScanner} />
          <Stack.Screen name="Home" component={HomeScreen} />
        </Stack.Navigator>
      </NavigationContainer>
    </ApolloProvider>
  );
}

export default App;
