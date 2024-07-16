import SwiftUI

struct ContentView: View {
    
    let titel: String = "COIN$ INFORMATION"
    
    var body: some View {
        NavigationStack {
            VStack() {
                Text(titel)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(Color(.systemOrange))
                    .padding(.top, 40)
                Spacer()
                NavigationLink(value: 1) {
                    Image(systemName: "bitcoinsign.circle")
                        .font(.system(size: 300))
                        .foregroundStyle(Color(.systemYellow))
                        .background(Color(.systemOrange))
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .shadow(color: .black, radius: 20)
                }
                Spacer()
            }
            .navigationDestination(for: Int.self) { value in
                CoinsView()
            }
        }
    }
    
}

