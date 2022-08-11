import Vapor
// UsersApiDelegate.swift
//
// Generated by vapor-server-codegen
// https://github.com/thecheatah/SwiftVapor-swagger-codegen
// Template Input: /APIs.Users


public enum usersBatchPostResponse: AsyncResponseEncodable {
  case http200([String:User])

  public func encodeResponse(for request: Request) -> EventLoopFuture<Response> {
    switch self {
    case .http200(let content):
      return content.encodeResponse(for: request).map { (response: Response) -> (Response) in
        response.status = HTTPStatus(statusCode: 200)
        return response
      }
    }
  }

  public func encodeResponse(for request: Request) async throws -> Response {
    switch self {
    case .http200(let content):
      var response = try await content.encodeResponse(for: request)
      response.status = HTTPStatus(statusCode: 200)
      return response
    }
  }
}


public enum usersIdGetResponse: AsyncResponseEncodable {
  case http200(User)

  public func encodeResponse(for request: Request) -> EventLoopFuture<Response> {
    switch self {
    case .http200(let content):
      return content.encodeResponse(for: request).map { (response: Response) -> (Response) in
        response.status = HTTPStatus(statusCode: 200)
        return response
      }
    }
  }

  public func encodeResponse(for request: Request) async throws -> Response {
    switch self {
    case .http200(let content):
      var response = try await content.encodeResponse(for: request)
      response.status = HTTPStatus(statusCode: 200)
      return response
    }
  }
}

public protocol UsersApiDelegate: AnyObject {
  associatedtype AuthType
  /**
  POST /users/batch */
  func usersBatchPost(with req: Request, asAuthenticated user: AuthType, body: Body) async throws -> usersBatchPostResponse
  /**
  GET /users/{id} */
  func usersIdGet(with req: Request, asAuthenticated user: AuthType, id: UUID) async throws -> usersIdGetResponse
}
