// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension ClipShareGQLDB {
  class SendToDeviceMutation: GraphQLMutation {
    public static let operationName: String = "sendToDevice"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        """
        mutation sendToDevice($data: NotificationInput!) {
          sendNotificationToDevice(data: $data) {
            __typename
            status
          }
        }
        """
      ))

    public var data: NotificationInput

    public init(data: NotificationInput) {
      self.data = data
    }

    public var __variables: Variables? { ["data": data] }

    public struct Data: ClipShareGQLDB.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { ClipShareGQLDB.Objects.Mutation }
      public static var __selections: [Selection] { [
        .field("sendNotificationToDevice", SendNotificationToDevice.self, arguments: ["data": .variable("data")]),
      ] }

      public var sendNotificationToDevice: SendNotificationToDevice { __data["sendNotificationToDevice"] }

      /// SendNotificationToDevice
      ///
      /// Parent Type: `Notification`
      public struct SendNotificationToDevice: ClipShareGQLDB.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { ClipShareGQLDB.Objects.Notification }
        public static var __selections: [Selection] { [
          .field("status", String.self),
        ] }

        public var status: String { __data["status"] }
      }
    }
  }

}