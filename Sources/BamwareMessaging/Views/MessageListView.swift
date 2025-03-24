
import SwiftUI
import BamwareCore
import BamwareUI

public struct MessageListView: View {
    public let messages: [Message]
    private let authService: AuthService
    private let theme: Theme
    
    public var shouldShowMessages: Bool {
        guard let user = authService.currentUser,
              let tenantID = messages.first?.tenantID,
              user.tenantID == tenantID else { return false }
        return user.roles.contains("\(tenantID):canMessage")
    }
    
    public init(messages: [Message] = [], tenantID: String = "demoTenant", isDarkMode: Bool = false, authService: AuthService) {
        self.messages = messages
        self.authService = authService
        self.theme = BrandingPalette.theme(for: tenantID, isDarkMode: isDarkMode)
    }
    
    public var body: some View {
        if shouldShowMessages {
            List(messages, id: \.id) { message in
                SmartText(message.content, theme: theme)
            }
            .navigationTitle("Messages")
            .background(theme.backgroundColor)
        } else {
            Text("No permission to view messages")
                .foregroundColor(theme.secondaryColor)
                .background(theme.backgroundColor)
        }
    }
}

// Preview for Xcode
struct MessageListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // Preview with messages and permission
            MessageListView(
                messages: [
                    Message(id: "1", content: "Hello", tenantID: "demoTenant"),
                    Message(id: "2", content: "World", tenantID: "demoTenant")
                ],
                tenantID: "demoTenant",
                isDarkMode: false,
                authService: MockAuthService(currentUser: User(
                    id: "1",
                    tenantID: "demoTenant",
                    roles: ["demoTenant:canMessage"]
                ))
            )
            .previewDisplayName("With Messages")
            
            // Preview without permission
            MessageListView(
                messages: [
                    Message(id: "1", content: "Hello", tenantID: "demoTenant"),
                    Message(id: "2", content: "World", tenantID: "demoTenant")
                ],
                tenantID: "demoTenant",
                isDarkMode: false,
                authService: MockAuthService(currentUser: User(
                    id: "1",
                    tenantID: "demoTenant",
                    roles: ["demoTenant:canView"]
                ))
            )
            .previewDisplayName("No Permission")
        }
    }
}

// Mock AuthService for preview
private class MockAuthService: AuthService {
    var currentUser: User?
    
    init(currentUser: User?) {
        self.currentUser = currentUser
    }
    
    func login(tenant: String, username: String, password: String) async throws -> User {
        fatalError("Not implemented")
    }
    
    func logout() async throws {}
    
    func signup(tenant: String, username: String, password: String) async throws -> User {
        fatalError("Not implemented")
    }
    
    func refreshToken() async throws -> User {
        fatalError("Not implemented")
    }
    
    func tenant(id: String) async throws -> Tenant {
        fatalError("Not implemented")
    }
}
