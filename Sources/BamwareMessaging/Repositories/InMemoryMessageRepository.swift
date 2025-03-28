import Foundation
import BamwareCore

public final class InMemoryMessageRepository: MessageRepository {
    private var messages: [Message] = []

    public init() {}

    public func send(_ message: Message) {
        messages.append(message)
    }

    public func fetchMessages(forUserId userId: UserID) -> [Message] {
        messages.filter {
            $0.senderId == userId || $0.recipientId == userId
        }
    }
}
