//
//  ChatBubbleShape.swift
//  MagicConstellation
//
//  Created by imac-2627 on 2024/1/23.
//

import SwiftUI

struct ChatBubbleShape: Shape {
    
    enum Direction {
        case left
        case right
    }

    let direction: Direction

    func path(in rect: CGRect) -> Path {
        return (direction == .left) ? getLeftBubblePath(in: rect) : getRightBubblePath(in: rect)
    }

    private func getLeftBubblePath(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let path = Path { p in
            p.move(to: CGPoint(x: 25, y: height))

            // 右下
            p.addLine(to: CGPoint(x: width - 20, y: height))
            p.addCurve(to: CGPoint(x: width, y: height - 20),
                       control1: CGPoint(x: width - 8, y: height),
                       control2: CGPoint(x: width, y: height - 8))
            // 右上
            p.addLine(to: CGPoint(x: width, y: 20))
            p.addCurve(to: CGPoint(x: width - 20, y: 0),
                       control1: CGPoint(x: width, y: 8),
                       control2: CGPoint(x: width - 8, y: 0))
            // 左上
//            p.addLine(to: CGPoint(x: 21, y: 0))
//            p.addCurve(to: CGPoint(x: 4, y: 20),
//                       control1: CGPoint(x: 12, y: 0),
//                       control2: CGPoint(x: 4, y: 8))

            p.addLine(to: CGPoint(x: 0, y: 0))
            p.addCurve(to: CGPoint(x: 4, y: 0),
                       control1: CGPoint(x: 12, y: 0),
                       control2: CGPoint(x: 0, y: 0))

            // 左下
            p.addLine(to: CGPoint(x: 4, y: height - 20))
            p.addCurve(to: CGPoint(x: 25, y: height),
                       control1: CGPoint(x: 4, y: height - 6),
                       control2: CGPoint(x: 12, y: height))

//            p.addLine(to: CGPoint(x: 4, y: height))
//            p.addCurve(to: CGPoint(x: 0, y: height ),
//                       control1: CGPoint(x: 4, y: height),
//                       control2: CGPoint(x: 0, y: height))
        }
        return path
    }

    private func getRightBubblePath(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let path = Path { p in

            p.move(to: CGPoint(x: 25, y: height))

            // 左下
            p.addLine(to: CGPoint(x: 20, y: height))
            p.addCurve(to: CGPoint(x: 0, y: height - 20),
                       control1: CGPoint(x: 8, y: height),
                       control2: CGPoint(x: 0, y: height - 8))
            // 左上
            p.addLine(to: CGPoint(x: 0, y: 20))
            p.addCurve(to: CGPoint(x: 20, y: 0),
                       control1: CGPoint(x: 0, y: 8),
                       control2: CGPoint(x: 8, y: 0))
            // 右上
            p.addLine(to: CGPoint(x: width - 21, y: 0))
            p.addCurve(to: CGPoint(x: width - 4, y: 20),
                       control1: CGPoint(x: width - 12, y: 0),
                       control2: CGPoint(x: width - 4, y: 8))
            // 右下
            p.addLine(to: CGPoint(x: width - 4, y: height - 20))
            p.addCurve(to: CGPoint(x: width - 25, y: height),
                       control1: CGPoint(x: width - 4, y: height - 8),
                       control2: CGPoint(x: width - 12, y: height))
        }
        return path
    }
}
