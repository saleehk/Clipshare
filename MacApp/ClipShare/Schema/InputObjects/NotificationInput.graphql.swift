// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension ClipShareGQLDB {
  struct NotificationInput: InputObject {
    public private(set) var __data: InputDict

    public init(_ data: InputDict) {
      __data = data
    }

    public init(
      deviceId: String,
      title: String,
      body: String,
      action: String,
      params: String,
      isSilent: GraphQLNullable<Bool> = nil
    ) {
      __data = InputDict([
        "deviceId": deviceId,
        "title": title,
        "body": body,
        "action": action,
        "params": params,
        "isSilent": isSilent
      ])
    }

    public var deviceId: String {
      get { __data["deviceId"] }
      set { __data["deviceId"] = newValue }
    }

    public var title: String {
      get { __data["title"] }
      set { __data["title"] = newValue }
    }

    public var body: String {
      get { __data["body"] }
      set { __data["body"] = newValue }
    }

    public var action: String {
      get { __data["action"] }
      set { __data["action"] = newValue }
    }

    public var params: String {
      get { __data["params"] }
      set { __data["params"] = newValue }
    }

    public var isSilent: GraphQLNullable<Bool> {
      get { __data["isSilent"] }
      set { __data["isSilent"] = newValue }
    }
  }

}