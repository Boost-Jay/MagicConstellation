//
//  ChatBubble.swift
//  MagicConstellation
//
//  Created by imac-2627 on 2024/1/17.
//

import SwiftUI

struct ChatBubble<Content>: View where Content: View {
    let direction: ChatBubbleShape.Direction
    let content: () -> Content

    init(direction: ChatBubbleShape.Direction, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.direction = direction
    }

    var body: some View {
        HStack {
            if direction == .right {
                Spacer()
            }

            content().clipShape(ChatBubbleShape(direction: direction))
            if direction == .left {
                Spacer()
            }
        }
        .padding([(direction == .left) ? .leading : .trailing, .top, .bottom], 20)
        .padding((direction == .right) ? .leading : .trailing, 50)
    }
}

struct Demo: View {
    var body: some View {
        ScrollView {
            VStack {
                ChatBubble(direction: .left) {
                    Text("A")
                        .padding(.all, 20)
                        .foregroundColor(Color.black)
                        .background(Color(red: 220 / 255, green: 194 / 255, blue: 211 / 255))
                }
                ChatBubble(direction: .right) {
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ut semper quam. Phasellus non mauris sem. Donec sed fermentum eros. Donec pretium nec turpis a semper. ")
                        .padding(.all, 20)
                        .foregroundColor(Color.black)
                        .background(Color(red: 235 / 255, green: 194 / 255, blue: 166 / 255))
                }
//                ChatBubble(direction: .right) {
//                    Image("dummyImage")
//                        .resizable()
//                        .frame(width: UIScreen.main.bounds.width - 70, height: 200)
//                        .aspectRatio(contentMode: .fill)
//                }
            }
        }
    }
}

#Preview("chat") {
    Demo()
}
