import React, { useEffect, useState } from 'react';
import { View, Text } from 'react-native';
import messaging from '@react-native-firebase/messaging';

export default function App() {
  const [token, setToken] = useState('');
  const [messages, setMessages] = useState([]);
  useEffect(() => {
    // crashlytics().log('App mounted.');
    async function sync() {
      await messaging().registerDeviceForRemoteMessages();
      const fcmToken = await messaging().getToken();
      console.log('fcmToken=>fcmToken', fcmToken);
      setToken(fcmToken);
    }
    sync();
  }, []);
  // const [username, setUsername] = useMMKVString("user.name")

  return (
    <View>
      <Text>Hello => {token}</Text>
      <Text>Messages</Text>
      {messages.map(message => {
        return <Text>{JSON.stringify(message)}</Text>;
      })}
    </View>
  );
}
