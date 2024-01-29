
//
//  CustomTabBarView.swift
//  MagicConstellation
//
//  Created by 王柏崴 on 1/23/24.
//

import SwiftUI

enum TabItem: String, CaseIterable {
    case home
    case profile
    
    var description: String {
        switch self {
        case .home:
            return "Story"
        case .profile:
            return "Profile"
        }
    }
    
    var icon: String {
        switch self {
        case .home:
            return "book.circle.fill"
        case .profile:
            return "brain.head.profile"
        }
    }
}

struct CustomTabBarView: View {
    @State var xAxis: CGFloat = 0
    @State var selectedTab: TabItem = .home
    @Namespace var animation
    @State private var showTabBar = false
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            GeometryReader { geometry in
                let width = geometry.size.width
                let height = geometry.size.height
                // 計算對角線長度
                let diagonal = sqrt(width * width + height * height) / 2 * 1.26 // 半徑為對角線的一半
                TabView(selection: $selectedTab) {
                    HomeView(hideTabBar: $showTabBar)
                        .ignoresSafeArea()
                        .tag(TabItem.home)
                        .padding(.bottom, 80)
                    
                    NatureDetailView()
                        .ignoresSafeArea()
                        .tag(TabItem.profile)
                }
//                .clipShape(Circle())
//                .frame(width: diagonal * 2, height: diagonal * 2) // 直徑為對角線長度
//                .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                
                VStack {
                    Spacer()
                    if showTabBar {
                        buildCustomTabBar()
                            .transition(
                                .scale
                                    .animation(.bouncy(duration: 0.45))
                            )
                    }
                }
            }
            .task {
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                withAnimation {
                    showTabBar = true
                }
            }
            .ignoresSafeArea()
        }
    }
     
    @ViewBuilder
    private func buildCustomTabBar() -> some View {
        VStack(alignment: .center) {
            HStack {
                ForEach(TabItem.allCases, id: \.self) { item in
                    GeometryReader { reader in
                        ZStack {
                            Button {
                                withAnimation(.interactiveSpring(dampingFraction: 2)) {
                                    selectedTab = item
                                    xAxis = reader.frame(in: .global).midX
                                }
                            } label: {
                                VStack(spacing: -15) {
                                    Image(systemName: item.icon)
                                        .resizable()
                                        .renderingMode(.template)
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(item == selectedTab ? Color.mint : Color.black)
                                        .background {
                                            Color.white.opacity(selectedTab == item ? 1 : 0)
                                                .clipShape(Circle())
                                        }
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 30)
                                                .stroke(.white, lineWidth: 4)
                                                .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 10)
                                        }
                                        .matchedGeometryEffect(id: item, in: animation)
                                        .offset(x: 0, y: selectedTab == item ? -40 : 0)
                                        .foregroundStyle(.blue)
                                        .frame(maxWidth: .infinity)
                                    
                                    Text(item.description)
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundColor(Color.black)
                                        .opacity(selectedTab == item ? 1 : 0)
                                }
                            }
                            .background(
                                GeometryReader { reader -> Color in
                                    DispatchQueue.main.async {
                                        if item == selectedTab {
                                            xAxis = reader.frame(in: .global).midX
                                        }
                                    }
                                    return Color.clear
                                }
                            )
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                    }
                    
                    if item != TabItem.allCases.last {
                        Spacer(minLength: 0)
                    }
                }
            }
            .padding(.horizontal, 100)
            .padding(.vertical, 10)
        }
        .frame(maxWidth: .infinity, maxHeight: 80)
        .background(Color.white.clipShape(CustomTabBarShape(xAxis: xAxis))
            .shadow(color: Color.black.opacity(0.35), radius: 10, x: 0, y: -15))
    }
    
    private func getIconColor(image: String) -> Color {
        switch image {
        case "book.circle.fill":
            return Color.red
        default:
            return Color.teal
        }
    }
}

#Preview("CustomTabBarView") {
    CustomTabBarView()
}
