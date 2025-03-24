
import BamwareCore

public protocol MessageRepository {
    func fetchMessages(forTenantID tenantID: String) async throws -> [Message]
    func sendMessage(_ message: Message) async throws
}
