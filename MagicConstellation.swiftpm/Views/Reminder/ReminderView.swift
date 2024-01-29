//
//  ReminderView.swift
//  MagicConstellation
//
//  Created by imac-2627 on 2024/1/19.
//

import SwiftUI

struct ReminderView: View {
    
    @Environment(\.appRootManager) private var appRootManager: AppRootManager
    @State private var animationAmount = 1.0
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                let width = geometry.size.width
                let height = geometry.size.height
                // 計算對角線長度
                let diagonal = sqrt(width * width + height * height) / 2 // 半徑為對角線的一半

                Circle()
                    .fill(Color.black)
                    .frame(width: diagonal * 2, height: diagonal * 2) // 直徑為對角線長度
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
            }
            .ignoresSafeArea()
            
            Text("星座只是一種輔助生活提示\n千萬不可完全迷信\n請保有自身理性\n做出最符合自身情況的判斷(´･ω･`)")
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .font(.title3)
                .fontWeight(.semibold)
                .padding(60)
                .background(.blue)
                .clipShape(Circle())
                .padding(8)
                .overlay(
                    Circle()
                        .stroke(
                            AngularGradient(
                                gradient: Gradient(
                                    colors:
                                        [
                                            .red,
                                            .orange,
                                            .yellow,
                                            .green,
                                            .blue,
                                            .purple,
                                            .brown
                                            
                                        ]
                                ),
                                center: .center
                            ),
                            lineWidth: 3
                        )
                        .scaleEffect(animationAmount)
                        .opacity(2 - animationAmount)
                        .animation(
                            .easeOut(duration: 1)
                            .repeatForever(autoreverses: false),
                            value: animationAmount
                        )
                )
                .onAppear {
                    animationAmount = 2
                }
                .padding(42)
        }
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
                withAnimation(.spring()) {
                    appRootManager.currentRoot = .landing
                }
            }
        }
    }
}

#Preview("ReminderView") {
    ReminderView()
}
