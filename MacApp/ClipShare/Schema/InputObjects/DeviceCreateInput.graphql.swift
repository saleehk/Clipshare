// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension ClipShareGQLDB {
  struct DeviceCreateInput: InputObject {
    public private(set) var __data: InputDict

    public init(_ data: InputDict) {
      __data = data
    }

    public init(
      name: String
    ) {
      __data = InputDict([
        "name": name
      ])
    }

    public var name: String {
      get { __data["name"] }
      set { __data["name"] = newValue }
    }
  }

}