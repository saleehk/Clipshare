// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension ClipShareGQLDB {
  class GetDeviceQuery: GraphQLQuery {
    public static let operationName: String = "getDevice"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        """
        query getDevice($id: String!) {
          device(id: $id) {
            __typename
            id
            name
          }
        }
        """
      ))

    public var id: String

    public init(id: String) {
      self.id = id
    }

    public var __variables: Variables? { ["id": id] }

    public struct Data: ClipShareGQLDB.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { ClipShareGQLDB.Objects.Query }
      public static var __selections: [Selection] { [
        .field("device", Device.self, arguments: ["id": .variable("id")]),
      ] }

      public var device: Device { __data["device"] }

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