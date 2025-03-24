
import BamwareCore

public struct Message: Codable {
    public let id: String
    public let content: String
    public let tenantID: String
    
    public init(id: String, content: String, tenantID: String) {
        self.id = id
        self.content = content
        self.tenantID = tenantID
    }
}
