//
//  HomeView.swift
//  MagicConstellation
//
//  Created by imac-2627 on 2024/1/19.
//

import SwiftUI

struct HomeView: View {
    @State private var progress: CGFloat = 0
    @State private var isPrimaryBackgroundSelected: Bool = false
    @State private var isPresented: Bool = false
    @Binding var hideTabBar: Bool

    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView(isPrimaryBackgroundSelected: $isPrimaryBackgroundSelected,
                               progress: $progress)

                VStack {
                    Button {
                        isPresented.toggle()
                        hideTabBar.toggle()
                    } label: {
                        HStack {
                            Image(systemName: "sparkles")
                            Text("START")
                        }
                        .foregroundColor(.white)
                        .font(.system(size: 48, weight: .semibold))
                        .frame(maxWidth: 300, minHeight: 80)
                        .background(.black)
                        .cornerRadius(50)
                    }
                    .padding()
                    .navigationDestination(isPresented: $isPresented) {
                        SceneChatView()
//                            .toolbar(.hidden, for: .tabBar)
                    }

                    CustomToggle(width: 120,
                                 height: 50,
                                 toggleWidthOffset: 20,
                                 cornerRadius: 30,
                                 padding: 10,
                                 isActive: $isPrimaryBackgroundSelected)
                }
            }
        }
        .clipShape(Circle())
        .ignoresSafeArea()
        .frame(width: 1100, height: 1100)
    }
}

#Preview("HomeView") {
    HomeView(hideTabBar: .constant(false))
}
