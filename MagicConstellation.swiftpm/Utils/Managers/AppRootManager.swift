//
//  AppRootManager.swift
//  MagicConstellation
//
//  Created by imac-2627 on 2024/1/19.
//

import SwiftUI

@Observable
final class AppRootManager {
    var currentRoot: eAppRoots = .reminder

    enum eAppRoots {
        case reminder
        case landing
    }
}

struct AppRootManagerEnvironmentKey: EnvironmentKey {
    static let defaultValue: AppRootManager = .init()
}
