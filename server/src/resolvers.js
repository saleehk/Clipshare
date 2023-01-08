import { v4 as uuidv4 } from 'uuid';
import { send } from './utils/firebase';

module.exports = {
  Query: {
  },
  Mutation: {
    createDevice: async (_source, { data }) => {
      const device_id = `device_${uuidv4()}`;
      await COPY_CLIP_KV.put(device_id, JSON.stringify(data))
      return {
        id: device_id,
        ...data
      }
    },
    setDeviceFcmToken: async (_source, { data }) => {
      const { deviceId, fcmToken } = data
      const device = await COPY_CLIP_KV.get(deviceId)
      if (device) {
        const device_data = JSON.parse(device)
        device_data.fcmToken = fcmToken
        await COPY_CLIP_KV.put(deviceId, JSON.stringify(device_data))
        return {
          id: deviceId,
          ...device_data
        }
      }
      throw new Error('Device not found')
    },
    sendNotificationToDevice: async (_source, { data }) => {

      const { deviceId, title, body, action, params, isSilent = true } = data
      const device = await COPY_CLIP_KV.get(deviceId)
      if (device) {
        const device_data = JSON.parse(device)
        fcmToken = device_data.fcmToken;
        let notification;
        if(isSilent===false)
        {
          notification = {
            title,
            body,
          }
        }
        const resposne = await send({
          fcmToken: device_data.fcmToken,
          notification,
          data: {
            action,
            params,
          }
        })
        return resposne

      } else {
        throw new Error('Device not found')
      }
    }
  }
}
