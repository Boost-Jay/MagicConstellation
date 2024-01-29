//
//  NatureDetailView.swift
//  MagicConstellation
//
//  Created by 王柏崴 on 1/22/24.
//

import SwiftUI
import TipKit

struct NatureDetailView: View {
    var body: some View {
        GeometryReader { geometry in
            let referWidth = geometry.size.width
            let referHeight = geometry.size.height
            VStack {
                ChoiceStateView()
                    .frame(height: referHeight / 3)
                    .padding(.bottom, 32)
                DetailView()
            }
        }
    }
}

struct ChoiceStateView: View {
    var body: some View {
        GeometryReader { geometry in
            let referWidth = geometry.size.width
            let referHeight = geometry.size.height

            VStack {
                Spacer()
                HStack {
                    Text("行星")
                        .font(.system(size: referWidth / 20, weight: .bold))
                        .offset(x: referWidth / 6, y: 0)
                    Spacer()
                }

                RoundedRectangle(cornerRadius: 50)
                    .stroke(lineWidth: 1.6)
                    .overlay(
                        HStack(spacing: 20) {
                            ForEach(0 ..< 4) { _ in
                                Button(action: {}) {
                                    Image("tent1")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: referWidth / 7, height: referWidth / 7)
                                        .clipShape(Circle())
                                }
                            }
                        }
                    )
                    .frame(width: referWidth / 1.3, height: referHeight / 5)
                    .padding(.leading)
                    .padding(.bottom)

                HStack {
                    Text("星座")
                        .font(.system(size: referWidth / 20, weight: .bold))
                        .offset(x: referWidth / 6, y: 0)
                    Spacer()
                }
                RoundedRectangle(cornerRadius: 50)
                    .stroke(lineWidth: 1.6)
                    .overlay(
                        HStack(spacing: 20) {
                            ForEach(0 ..< 4) { _ in
                                Button(action: {}) {
                                    Image("tent2")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: referWidth / 7, height: referWidth / 7)
                                        .clipShape(Circle())
                                }
                            }
                        }
                    )
                    .frame(width: referWidth / 1.3, height: referHeight / 5)
                    .padding(.leading)
            }
        }
    }
}

struct DetailView: View {
    var body: some View {
        GeometryReader { geometry in
            let referWidth = geometry.size.width
            let referHeight = geometry.size.height
            VStack(spacing: 0) {
                HStack {
                    Circle()
                        .frame(width: referWidth / 10)
                    Text("test")
                        .font(.system(size: referWidth / 15, weight: .bold))
                }
                .offset(x: -referWidth / 6)
                .frame(maxWidth: .infinity)
                .padding(.bottom)

                Text("發展方向💪")
                    .offset(x: -referWidth / 4.3)
                    .padding(4)

                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 1.6)
                    .overlay(
                        ScrollView(.vertical, showsIndicators: true) {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("test")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding()
                        }
                    )
                    .frame(width: referWidth / 1.3, height: referHeight / 4)
                    .padding(.bottom)

                Text("改進方向🔧")
                    .offset(x: -referWidth / 4.3)
                    .padding(4)
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 1.6)
                    .overlay(
                        ScrollView(.vertical, showsIndicators: true) {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("test")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding()
                        })
                    .frame(width: referWidth / 1.3, height: referHeight / 4)
                    .padding(.bottom)
            }
        }
    }
}

#Preview("NatureDetailView") {
    NatureDetailView()
}
