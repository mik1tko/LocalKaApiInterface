import Vapor
import RoutingKit

// routes.swift
//
// Generated by vapor-server-codegen
// https://github.com/thecheatah/SwiftVapor-swagger-codegen
// Template Input: 

extension String {
  var asPathComponents: [PathComponent] {
    return self.split(separator: "/").map {
      if $0.starts(with: "{") && $0.hasSuffix("}") {
        let start = $0.index($0.startIndex, offsetBy: 1)
        let end = $0.index($0.endIndex, offsetBy: -1)
        return PathComponent.parameter(String($0[start..<end]))
      } else {
        return PathComponent.constant(.init($0))
      }
    }
  }
}

public protocol AuthenticationMiddleware: AsyncMiddleware {
  associatedtype AuthType: Authenticatable
  func authType() -> AuthType.Type
}

//Used when auth is not used
public class DummyAuthType: Authenticatable {}

public func routes<authForBasicAuth: AuthenticationMiddleware, authForBearerAuth: AuthenticationMiddleware, authForBearerAuthOptional: AuthenticationMiddleware, authentication: AuthenticationApiDelegate, chats: ChatsApiDelegate, messages: MessagesApiDelegate, users: UsersApiDelegate, usersOptional: UsersOptionalApiDelegate>
  (_ app: RoutesBuilder, authentication: authentication, chats: chats, messages: messages, users: users, usersOptional: usersOptional, authForBasicAuth: authForBasicAuth, authForBearerAuth: authForBearerAuth, authForBearerAuthOptional: authForBearerAuthOptional)
  throws
  where authForBasicAuth.AuthType == authentication.AuthType, authForBasicAuth.AuthType == chats.AuthType, authForBasicAuth.AuthType == messages.AuthType, authForBasicAuth.AuthType == users.AuthType, authForBasicAuth.AuthType == usersOptional.AuthType, authForBearerAuth.AuthType == authentication.AuthType, authForBearerAuth.AuthType == chats.AuthType, authForBearerAuth.AuthType == messages.AuthType, authForBearerAuth.AuthType == users.AuthType, authForBearerAuth.AuthType == usersOptional.AuthType, authForBearerAuthOptional.AuthType == authentication.AuthType, authForBearerAuthOptional.AuthType == chats.AuthType, authForBearerAuthOptional.AuthType == messages.AuthType, authForBearerAuthOptional.AuthType == users.AuthType, authForBearerAuthOptional.AuthType == usersOptional.AuthType
  {
  let groupForBasicAuth = app.grouped([authForBasicAuth])
  let groupForBearerAuth = app.grouped([authForBearerAuth])
  let groupForBearerAuthOptional = app.grouped([authForBearerAuthOptional])
  //for authentication
  groupForBasicAuth.on(.GET, "/auth".asPathComponents) { (request: Request) async throws -> authGetResponse in
    return try await authentication.authGet(with: request, asAuthenticated: request.auth.require(authForBasicAuth.authType()))
  }
  //for chats
  groupForBearerAuth.on(.GET, "/chats".asPathComponents) { (request: Request) async throws -> chatsGetResponse in
    return try await chats.chatsGet(with: request, asAuthenticated: request.auth.require(authForBearerAuth.authType()))
  }
  groupForBearerAuth.on(.POST, "/chats".asPathComponents) { (request: Request) async throws -> chatsPostResponse in
    let body = try request.content.decode(CreateChatBody.self)
    return try await chats.chatsPost(with: request, asAuthenticated: request.auth.require(authForBearerAuth.authType()), body: body)
  }
  groupForBearerAuth.on(.GET, "/users/{username}/direct".asPathComponents) { (request: Request) async throws -> usersUsernameDirectGetResponse in
    guard let username = request.parameters.get("username", as: String.self) else {
      throw Abort(HTTPResponseStatus.badRequest, reason: "Missing parameter username")
    }
    return try await chats.usersUsernameDirectGet(with: request, asAuthenticated: request.auth.require(authForBearerAuth.authType()), username: username)
  }
  //for messages
  groupForBearerAuth.on(.GET, "/chats/{chat_id}".asPathComponents) { (request: Request) async throws -> chatsChatIdGetResponse in
    let beforeId = try? request.query.get(Int.self, at: "beforeId")
    let limit = try? request.query.get(Int.self, at: "limit")
    guard let chatId = request.parameters.get("chatId", as: UUID.self) else {
      throw Abort(HTTPResponseStatus.badRequest, reason: "Missing parameter chatId")
    }
    return try await messages.chatsChatIdGet(with: request, asAuthenticated: request.auth.require(authForBearerAuth.authType()), chatId: chatId, beforeId: beforeId, limit: limit)
  }
  groupForBearerAuth.on(.POST, "/chats/{chat_id}".asPathComponents) { (request: Request) async throws -> chatsChatIdPostResponse in
    guard let chatId = request.parameters.get("chatId", as: UUID.self) else {
      throw Abort(HTTPResponseStatus.badRequest, reason: "Missing parameter chatId")
    }
    let body = try request.content.decode(PostMessage.self)
    return try await messages.chatsChatIdPost(with: request, asAuthenticated: request.auth.require(authForBearerAuth.authType()), body: body, chatId: chatId)
  }
  groupForBearerAuth.on(.POST, "/users/{username}/direct".asPathComponents) { (request: Request) async throws -> usersUsernameDirectPostResponse in
    guard let username = request.parameters.get("username", as: String.self) else {
      throw Abort(HTTPResponseStatus.badRequest, reason: "Missing parameter username")
    }
    let body = try request.content.decode(PostMessage.self)
    return try await messages.usersUsernameDirectPost(with: request, asAuthenticated: request.auth.require(authForBearerAuth.authType()), body: body, username: username)
  }
  //for users
  groupForBearerAuth.on(.GET, "/users/{username}".asPathComponents) { (request: Request) async throws -> usersUsernameGetResponse in
    guard let username = request.parameters.get("username", as: String.self) else {
      throw Abort(HTTPResponseStatus.badRequest, reason: "Missing parameter username")
    }
    return try await users.usersUsernameGet(with: request, asAuthenticated: request.auth.require(authForBearerAuth.authType()), username: username)
  }
  //for usersOptional
  groupForBearerAuthOptional.on(.POST, "/users".asPathComponents) { (request: Request) async throws -> usersPostResponse in
    let body = try request.content.decode(CreateUserRequestBody.self)
    return try await usersOptional.usersPost(with: request, asAuthenticated: request.auth.require(authForBearerAuthOptional.authType()), body: body)
  }
}

