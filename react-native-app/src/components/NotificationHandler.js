import { useEffect } from 'react';
import messaging from '@react-native-firebase/messaging';
import { handleMessage, handleNotificationClick } from '../lib/actions';
messaging().setBackgroundMessageHandler(async remoteMessage => {
  console.log(
    'Message handled in the background!',
    JSON.stringify(remoteMessage, null, 2),
  );
  handleMessage(remoteMessage);
});

export default function NotificationHandler() {
  useEffect(() => {
    const unsubscribe = messaging().onMessage(async remoteMessage => {
      // Alert.alert('A new FCM message arrived!', JSON.stringify(remoteMessage));
      console.log('Message handled in the background!');
      console.log(handleMessage);
      handleMessage(remoteMessage);
    });
    messaging().onNotificationOpenedApp(handleNotificationClick);

    // Check whether an initial notification is available
    messaging()
      .getInitialNotification()
      .then(remoteMessage => {
        if (remoteMessage) {
          handleNotificationClick(remoteMessage);
        }
      });
    return unsubscribe;
  }, []);

  return null;
}
