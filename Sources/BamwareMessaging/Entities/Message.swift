import Foundation

public struct Message: Codable, Identifiable, Equatable {
    public let id: UUID
    public let senderId: UUID
    public let recipientId: UUID
    public let content: String
    public let timestamp: Date

    public init(id: UUID = UUID(), senderId: UUID, recipientId: UUID, content: String, timestamp: Date = Date()) {
        self.id = id
        self.senderId = senderId
        self.recipientId = recipientId
        self.content = content
        self.timestamp = timestamp
    }
}