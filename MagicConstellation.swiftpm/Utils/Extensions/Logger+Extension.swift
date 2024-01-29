//
//  File.swift
//  
//
//  Created by imac-2627 on 2024/1/24.
//

import Foundation
import OSLog

extension Logger {
    
    private static var subsystem = Bundle.main.bundleIdentifier!
    
    static let viewCycle = Logger(subsystem: subsystem, category: "viewCycle")
    
    static let api = Logger(subsystem: subsystem, category: "API")
}
