// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension ClipShareGQLDB {
  class RegisterDeviceMutation: GraphQLMutation {
    public static let operationName: String = "registerDevice"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        """
        mutation registerDevice($data: DeviceCreateInput!) {
          createDevice(data: $data) {
            __typename
            id
          }
        }
        """
      ))

    public var data: DeviceCreateInput

    public init(data: DeviceCreateInput) {
      self.data = data
    }

    public var __variables: Variables? { ["data": data] }

    public struct Data: ClipShareGQLDB.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { ClipShareGQLDB.Objects.Mutation }
      public static var __selections: [Selection] { [
        .field("createDevice", CreateDevice.self, arguments: ["data": .variable("data")]),
      ] }

      public var createDevice: CreateDevice { __data["createDevice"] }

      /// CreateDevice
      ///
      /// Parent Type: `Device`
      public struct CreateDevice: ClipShareGQLDB.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { ClipShareGQLDB.Objects.Device }
        public static var __selections: [Selection] { [
          .field("id", String.self),
        ] }

        public var id: String { __data["id"] }
      }
    }
  }

}