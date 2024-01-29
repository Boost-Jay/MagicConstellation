//
//  Color+Extensions.swift
//  MagicConstellation
//
//  Created by imac-2627 on 2024/1/23.
//

import SwiftUI

extension Color {
    static let mainColor = "mainColor"
    
    static let lightShadow = "lightShadow"
    
    static let darkShadow = "darkShadow"
    
    static let gradient1 = Gradient(colors: [.purple, .yellow])
    
    static let gradient2 = Gradient(colors: [.blue, .purple])
    
    static let background = LinearGradient(gradient: Gradient(colors: [Color("background1"), Color("background2")]),
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing)
}
