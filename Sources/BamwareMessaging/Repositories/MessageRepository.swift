import Foundation
import BamwareCore

public protocol MessageRepository {
    func send(_ message: Message)
    func fetchMessages(forUserId userId: UserID) -> [Message]
}
