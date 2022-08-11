//
// Chat.swift
//
// Generated by vapor-server-codegen
// https://github.com/thecheatah/SwiftVapor-swagger-codegen
// Template Input: /Models.Chat

import Vapor


public final class Chat: Content {

    public var id: UUID
    public var createAt: Date
    public var updateAt: Date
    public var lastMessageAt: Date?
    public var type: ChatType
    /** Всегда есть у типов channel и group */
    public var name: String?
    /** Всегда есть у типов channel и group */
    public var image: String?
    /** Для group */
    public var creatorId: UUID?
    /** Всегда есть у типа direct */
    public var userId: UUID?
    /** для channel и group */
    public var isPublic: Bool?

    public init(id: UUID, createAt: Date, updateAt: Date, lastMessageAt: Date?, type: ChatType, name: String?, image: String?, creatorId: UUID?, userId: UUID?, isPublic: Bool?) { 
        self.id = id
        self.createAt = createAt
        self.updateAt = updateAt
        self.lastMessageAt = lastMessageAt
        self.type = type
        self.name = name
        self.image = image
        self.creatorId = creatorId
        self.userId = userId
        self.isPublic = isPublic
    }

    public enum CodingKeys: String, CodingKey { 
        case id = "id"
        case createAt = "create_at"
        case updateAt = "update_at"
        case lastMessageAt = "last_message_at"
        case type = "type"
        case name = "name"
        case image = "image"
        case creatorId = "creator_id"
        case userId = "user_id"
        case isPublic = "is_public"
    }

}
