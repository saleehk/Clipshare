// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public protocol ClipShareGQLDB_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == ClipShareGQLDB.SchemaMetadata {}

public protocol ClipShareGQLDB_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == ClipShareGQLDB.SchemaMetadata {}

public protocol ClipShareGQLDB_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == ClipShareGQLDB.SchemaMetadata {}

public protocol ClipShareGQLDB_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == ClipShareGQLDB.SchemaMetadata {}

public extension ClipShareGQLDB {
  typealias ID = String

  typealias SelectionSet = ClipShareGQLDB_SelectionSet

  typealias InlineFragment = ClipShareGQLDB_InlineFragment

  typealias MutableSelectionSet = ClipShareGQLDB_MutableSelectionSet

  typealias MutableInlineFragment = ClipShareGQLDB_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    public static func objectType(forTypename typename: String) -> Object? {
      switch typename {
      case "Mutation": return ClipShareGQLDB.Objects.Mutation
      case "Device": return ClipShareGQLDB.Objects.Device
      case "Query": return ClipShareGQLDB.Objects.Query
      case "Notification": return ClipShareGQLDB.Objects.Notification
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}