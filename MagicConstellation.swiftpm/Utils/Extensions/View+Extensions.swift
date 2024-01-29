//
//  View+Extensions.swift
//  MagicConstellation
//
//  Created by 王柏崴 on 1/22/24.
//

import SwiftUI

extension View {
    func animatableGradient(fromGradient: Gradient, toGradient: Gradient, progress: CGFloat) -> some View {
        modifier(AnimatableGradientModifier(fromGradient: fromGradient,
                                            toGradient: toGradient,
                                            progress: progress))
    }
}

extension View {
    @ViewBuilder
    func `if`<Content: View>(
        _ condition: Bool,
        transform: (Self) -> Content,
        else elseTransform: (Self) -> Content
    ) -> some View {
        if condition {
            transform(self)
        } else {
            elseTransform(self)
        }
    }
}

