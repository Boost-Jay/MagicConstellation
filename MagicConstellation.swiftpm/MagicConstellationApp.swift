import SwiftUI

@main
struct MagicConstellationApp: App {
    @State private var appRootManager = AppRootManager()

    var body: some Scene {
        WindowGroup {
            Group {
                switch appRootManager.currentRoot {
                case .landing:
                    CustomTabBarView()
                        .transition(
                            .scale
                                .animation(
                                    .spring(duration: 1, bounce: 0.7)
                                        .delay(1)
                                )
                        )
                case .reminder:
                    ReminderView()
                        .transition(
                            .scale
                                .animation(.easeInOut(duration: 0.7))
                        )
                }
            }
            .environment(\.appRootManager, appRootManager)
        }
    }
}
