import SwiftUI

public struct MessageListView: View {
    public let messages: [Message]

    public init(messages: [Message]) {
        self.messages = messages
    }

    public var body: some View {
        List(messages) { message in
            VStack(alignment: .leading, spacing: 4) {
                Text(message.content)
                    .font(.body)
                Text(message.timestamp, style: .time)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 4)
        }
    }
}