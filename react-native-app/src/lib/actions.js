import Clipboard from '@react-native-clipboard/clipboard';
import { Linking } from 'react-native';
const actionHandlers = {
  COPY_TEXT: params => {
    Clipboard.setString(params?.text);
  },
  OPEN_LINK: params => {
    Linking.openURL(params?.url);
  },
};
export function handleAction(actionType, params) {
  //   const { action: actionType } = action;
  const handler = actionHandlers[actionType];
  console.log('actionType=>actionType', actionType);
  if (handler) {
    handler(params);
  }
}
export function handleMessage(remoteMessage) {
  const { data } = remoteMessage;
  const { action } = data;
  const params = JSON.parse(data?.params);
  handleAction(action, params);
}
// check text is url or not
export function isUrl(text) {
  const urlRegex = /^(https?:\/\/)?([\da-z.-]+)\.([a-z.]{2,6})([/\w .-]*)*\/?$/;
  return urlRegex.test(text);
}
export function handleNotificationClick(remoteMessage) {
  const { data } = remoteMessage;
  const { action } = data;
  const params = JSON.parse(data?.params);
  handleAction(action, params);
  if (isUrl(params?.text)) {
    try {
      Linking.openURL(params?.text);
    } catch (error) {}
  }
}
