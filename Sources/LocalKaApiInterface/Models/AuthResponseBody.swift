//
// AuthResponseBody.swift
//
// Generated by vapor-server-codegen
// https://github.com/thecheatah/SwiftVapor-swagger-codegen
// Template Input: /Models.AuthResponseBody

import Vapor


public final class AuthResponseBody: Content {

    public var token: String

    public init(token: String) { 
        self.token = token
    }

    public enum CodingKeys: String, CodingKey { 
        case token = "token"
    }

}
