//
//  SwiftUIView.swift
//
//
//  Created by 王柏崴 on 1/22/24.
//

import SwiftUI

struct CustomToggle: View {
    
    let width: CGFloat
    let height: CGFloat
    let toggleWidthOffset: CGFloat
    let cornerRadius: CGFloat
    let padding: CGFloat

    @State var isSwitchToggled = false
    @State var switchWidth: CGFloat = 0.0
    @Binding var isActive: Bool

    var body: some View {
        ZStack {
            DeepConcaveView(cornerRadius: cornerRadius)
//            ShallowConcaveView(cornerRadius: cornerRadius)
                .frame(width: width, height: height)

            HStack {
                Text("🔥")
//                    .bold()
//                    .foregroundColor(.green)

                Spacer()

                Text("🌟")
//                    .bold()
//                    .foregroundColor(.red)
            }
            .padding()
            .frame(width: width, height: height)

            HStack {
                if isSwitchToggled {
                    Spacer()
                }

                RoundedRectangle(cornerRadius: cornerRadius)
                    .padding(padding)
                    .frame(width: switchWidth + toggleWidthOffset, height: height)
                    .animation(.spring(response: 0.5), value: isSwitchToggled)
                    .foregroundColor(Color(Color.mainColor))
                    .shadow(color: Color(Color.lightShadow),
                            radius: 2,
                            x: -3,
                            y: -3)
                    .shadow(color: Color(Color.darkShadow),
                            radius: 3,
                            x: 3,
                            y: 3)

                if !isSwitchToggled {
                    Spacer()
                }
            }
        }
        .frame(width: width, height: height)
        .onTapGesture {
            isSwitchToggled.toggle()
            withAnimation(.easeInOut(duration: 0.2)) {
                switchWidth = width
            }
            withAnimation(.easeInOut(duration: 0.4)) {
                switchWidth = height
            }
            isActive.toggle()
        }
        .onAppear {
            switchWidth = height
        }
    }
}

struct ShallowConcaveView: View {
    
    let cornerRadius: CGFloat

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(Color(Color.mainColor))
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(Color(Color.darkShadow), lineWidth: 2)
                .blur(radius: 0.5)
                .offset(x: 1, y: 0.5)
                .mask(RoundedRectangle(cornerRadius: cornerRadius).fill(LinearGradient(colors: [Color(Color.darkShadow), Color.clear], startPoint: .top, endPoint: .bottom)))
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(Color(Color.lightShadow), lineWidth: 2)
                .blur(radius: 0.5)
                .offset(x: -1, y: -1.5)
                .mask(RoundedRectangle(cornerRadius: cornerRadius).fill(LinearGradient(colors: [Color.clear, Color(Color.lightShadow)], startPoint: .top, endPoint: .bottom)))
        }
    }
}

struct DeepConcaveView: View {
    let cornerRadius: CGFloat

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(Color(Color.mainColor))
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(Color(Color.darkShadow), lineWidth: 2)
                .blur(radius: 0.5)
                .offset(x: 1, y: 1)
                .mask(RoundedRectangle(cornerRadius: cornerRadius).fill(LinearGradient(colors: [Color(Color.darkShadow), Color.clear], startPoint: .top, endPoint: .bottom)))
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(Color(Color.darkShadow), lineWidth: 6)
                .blur(radius: 3)
                .offset(x: 3, y: 3)
                .mask(RoundedRectangle(cornerRadius: cornerRadius).fill(LinearGradient(colors: [Color(Color.darkShadow), Color.clear], startPoint: .top, endPoint: .bottom)))
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(Color(Color.lightShadow), lineWidth: 2)
                .blur(radius: 0.5)
                .offset(x: -1, y: -1)
                .mask(RoundedRectangle(cornerRadius: cornerRadius).fill(LinearGradient(colors: [Color.clear, Color(Color.lightShadow)], startPoint: .top, endPoint: .bottom)))
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(Color(Color.lightShadow), lineWidth: 6)
                .blur(radius: 3)
                .offset(x: -3, y: -3)
                .mask(RoundedRectangle(cornerRadius: cornerRadius).fill(LinearGradient(colors: [Color.clear, Color(Color.lightShadow)], startPoint: .top, endPoint: .bottom)))
        }
    }
}

#Preview("CustomToggle") {
    CustomToggle(width: 120, height: 50, toggleWidthOffset: 20, cornerRadius: 30, padding: 10, isActive: .constant(true))
}
