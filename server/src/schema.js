const { gql } = require('apollo-server-cloudflare')

module.exports = gql`
type Device {
    id: String!
    name: String!
    fcmToken: [String]!
    type: String!
}

input DeviceCreateInput {
    name: String!
}
input DeviceUpdateFcmInput {
    deviceId: String!
    fcmToken: String
}
input NotificationInput {
    deviceId: String!
    title: String!
    body: String!
    action: String!
    params: String!
    isSilent: Boolean
}
type Notification {
    status: String!
}

type Mutation {
    createDevice(data: DeviceCreateInput!): Device!
    setDeviceFcmToken(data:DeviceUpdateFcmInput! ): Device!
    sendNotificationToDevice(data: NotificationInput!): Notification!
}
type Query {
    device(id: String!): Device!
    devices: [Device!]!
}
`
