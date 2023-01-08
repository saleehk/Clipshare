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
