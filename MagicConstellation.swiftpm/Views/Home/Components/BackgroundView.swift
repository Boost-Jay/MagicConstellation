//
//  SwiftUIView.swift
//
//
//  Created by imac-2627 on 2024/1/23.
//

import OSLog
import SwiftUI

struct BackgroundView: View {
    @Binding var isPrimaryBackgroundSelected: Bool
    @Binding var progress: CGFloat
    @State private var animationResetKey = UUID()
    @State private var isSwitchActive: Bool = false
    @State private var animate = false
    
    var body: some View {
        if !isPrimaryBackgroundSelected {
            Circle()
                .animatableGradient(fromGradient: Color.gradient1,
                                    toGradient: Color.gradient2,
                                    progress: progress)
                .id(animationResetKey)
                .clipShape(Circle())
                .ignoresSafeArea()
                .frame(width: 1100, height: 1100)
                .onAppear {
                    startAnimation()
                }
            
                .onChange(of: isPrimaryBackgroundSelected, initial: true) {
                    //                    print(isPrimaryBackgroundSelected)
                    if isSwitchActive && !isPrimaryBackgroundSelected {
                        animationResetKey = UUID()
                        progress = 0.0
                        startAnimation()
                    }
                }
        } else {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                    .onAppear {
                        Logger.viewCycle.notice("Change Background2")
                        isSwitchActive = true
                        //                        print(isSwitchActive)
                    }
                
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    Image("campfire2")
                        .resizable()
                        .frame(width: 250, height: 250)
                        .offset(x: -70, y: -40)
                        .overlay(
                            Circle()
                                .fill(Color.yellow.opacity(0.3)) // 光晕的顏色和透明度
                                .frame(width: 100, height: 100) // 光晕的初始尺寸
                                .scaleEffect(animate ? 1.5 : 1.0) // 放大缩小效果
                                .blur(radius: 10) // 模糊半徑
                                .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true),
                                           value: animate)
                                .onAppear {
                                    Logger.viewCycle.notice("Set halo")
                                    self.animate.toggle()
                                },
                            alignment: .leading
                        )
                    
                    Image("tent1")
                        .frame(width: 400, height: 400)
                        .offset(x: 30, y: 80)
                        .overlay(
                            Circle()
                                .fill(Color.yellow.opacity(0.3))
                                .frame(width: 180, height: 180)
                                .scaleEffect(animate ? 1.2 : 0.8)
                                .blur(radius: 10)
                                .animation(Animation.easeInOut(duration: 7).repeatForever(autoreverses: true), value: animate),
                            alignment: .centerFirstTextBaseline
                        )
                }
            }
        }
    }

    func startAnimation() {
        withAnimation(.linear(duration: 5.0).repeatForever(autoreverses: true)) {
            progress = 1.0
        }
    }
}

#Preview("BackgroundView") {
    BackgroundView(isPrimaryBackgroundSelected: .constant(false), progress: .constant(0))
}
