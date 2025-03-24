
import XCTest
@testable import BamwareMessaging
import SwiftUI
import BamwareCore
import BamwareUI

@MainActor
final class MessageListViewTests: XCTestCase {
    func test_messageListView_showsMessages_withPermission() {
        let messages = [
            Message(id: "1", content: "Hello", tenantID: "demoTenant"),
            Message(id: "2", content: "World", tenantID: "demoTenant")
        ]
        let authService = MockAuthService(currentUser: User(id: "1", tenantID: "demoTenant", roles: ["demoTenant:canMessage"]))
        let sut = MessageListView(messages: messages, tenantID: "demoTenant", isDarkMode: false, authService: authService)
        
        XCTAssertTrue(sut.shouldShowMessages)
        // Add ViewInspector later for body—basic check for now
        XCTAssertNotNil(sut)
    }
    
    func test_messageListView_hidesMessages_withoutPermission() {
        let messages = [
            Message(id: "1", content: "Hello", tenantID: "demoTenant"),
            Message(id: "2", content: "World", tenantID: "demoTenant")
        ]
        let authService = MockAuthService(currentUser: User(id: "1", tenantID: "demoTenant", roles: ["demoTenant:canView"]))
        let sut = MessageListView(messages: messages, tenantID: "demoTenant", isDarkMode: false, authService: authService)
        
        XCTAssertFalse(sut.shouldShowMessages)
        XCTAssertNotNil(sut)
    }
}

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
