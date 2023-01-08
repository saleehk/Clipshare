// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension ClipShareGQLDB {
  class GetDevicesQuery: GraphQLQuery {
    public static let operationName: String = "getDevices"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        """
        query getDevices {
          devices {
            __typename
            id
            name
          }
        }
        """
      ))

    public init() {}

    public struct Data: ClipShareGQLDB.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { ClipShareGQLDB.Objects.Query }
      public static var __selections: [Selection] { [
        .field("devices", [Device].self),
      ] }

      public var devices: [Device] { __data["devices"] }

      /// Device
      ///
      /// Parent Type: `Device`
      public struct Device: ClipShareGQLDB.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { ClipShareGQLDB.Objects.Device }
        public static var __selections: [Selection] { [
          .field("id", String.self),
          .field("name", String.self),
        ] }

        public var id: String { __data["id"] }
        public var name: String { __data["name"] }
      }
    }
  }

}