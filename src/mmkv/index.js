import { MMKV } from 'react-native-mmkv';

// export const storage = new MMKV();
export const storage = new MMKV({
  id: 'user-storage',
  //   path: `${USER_DIRECTORY}/storage`,
  //   encryptionKey: 'hunter2',
});
