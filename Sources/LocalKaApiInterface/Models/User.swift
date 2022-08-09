//
// User.swift
//
// Generated by vapor-server-codegen
// https://github.com/thecheatah/SwiftVapor-swagger-codegen
// Template Input: /Models.User

import Vapor


public final class User: Content {

    public var username: String
    public var name: String?
    public var avatar: String?
    public var createAt: Date
    public var updateAt: Date?

    public init(username: String, name: String?, avatar: String?, createAt: Date, updateAt: Date?) { 
        self.username = username
        self.name = name
        self.avatar = avatar
        self.createAt = createAt
        self.updateAt = updateAt
    }

    public enum CodingKeys: String, CodingKey { 
        case username = "username"
        case name = "name"
        case avatar = "avatar"
        case createAt = "create_at"
        case updateAt = "update_at"
    }

}
