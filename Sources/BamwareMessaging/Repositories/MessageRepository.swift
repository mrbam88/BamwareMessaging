import Foundation

public protocol MessageRepository {
    func send(_ message: Message)
    func fetchMessages(forUserId userId: UUID) -> [Message]
}