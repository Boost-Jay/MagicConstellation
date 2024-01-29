
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeDemoView()
                .tabItem {
                    Label("", systemImage: "house.fill")
                }
        }
    }
}

struct HomeDemoView: View {
    
    private var data = Array(1 ... 20)
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 140)),
    ]

    private let fixedColumn = [
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
        GridItem(.fixed(200)),
    ]

    var body: some View {
        VStack {
            Button {
            } label: {
                Text("Register")
                    .font(.title)
            }
            .tint(.white)
            .frame(width: 300, height: 100)
            .background {
                UnevenRoundedRectangle(cornerRadii: .init(
                    topLeading: 10.0,
                    bottomLeading: 10.0,
                    bottomTrailing: 50.0,
                    topTrailing: 30.0),
                style: .continuous)
                    .foregroundStyle(.indigo)
            }

            NavigationStack {
                NavigationLink("") {
                    ContentView2()
                }
            }
            ScrollView {
                LazyVGrid(columns: adaptiveColumn, spacing: 20) {
                    ForEach(data, id: \.self) { item in
                        Text(String(item))
                            .frame(width: 150, height: 150, alignment: .center)
                            .background(.blue)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .font(.title)
                    }
                }
            }.padding()
        }
    }
}

struct ContentView2: View {
    
    var body: some View {
        Grid {
            GridRow {
                Text("Row 1")
                ForEach(0 ..< 3) { _ in
                    Circle().foregroundColor(.red)
                }
            }
            GridRow {
                Text("Row 2")
                ForEach(0 ..< 5) { _ in
                    Circle().foregroundColor(.green)
                }
            }
            GridRow {
                Text("Row 3")
                ForEach(0 ..< 4) { _ in
                    Circle().foregroundColor(.mint)
                }
            }
        }.padding()
    }
}

#Preview() {
    ContentView()
}
