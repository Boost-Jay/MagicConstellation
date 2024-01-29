//
//  EnvironmentValues+Extensions.swift
//  MagicConstellation
//
//  Created by imac-2627 on 2024/1/23.
//

import SwiftUI

extension EnvironmentValues {
    
    var appRootManager: AppRootManager {
        get { self[AppRootManagerEnvironmentKey.self] }
        set { self[AppRootManagerEnvironmentKey.self] = newValue }
    }
}
