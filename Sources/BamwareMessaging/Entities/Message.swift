import Foundation
import BamwareCore

public struct Message: DomainIdentifiable, Codable, Equatable {
    public let id: MessageID
    public let senderId: UserID
    public let recipientId: UserID
    public let content: String
    public let timestamp: Date

    public init(
        id: MessageID = MessageID(UUID()),
        senderId: UserID,
        recipientId: UserID,
        content: String,
        timestamp: Date = Date()
    ) {
        self.id = id
        self.senderId = senderId
        self.recipientId = recipientId
        self.content = content
        self.timestamp = timestamp
    }
}
