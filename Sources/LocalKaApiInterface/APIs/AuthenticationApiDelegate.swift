import Vapor
// AuthenticationApiDelegate.swift
//
// Generated by vapor-server-codegen
// https://github.com/thecheatah/SwiftVapor-swagger-codegen
// Template Input: /APIs.Authentication


public enum authGetResponse: AsyncResponseEncodable {
  case http200(AuthResponseBody)

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

public protocol AuthenticationApiDelegate: AnyObject {
  associatedtype AuthType
  /**
  GET /auth */
  func authGet(with req: Request, asAuthenticated user: AuthType) async throws -> authGetResponse
}
