import SwiftUI

struct CoinsView: View {
    
    @StateObject var vm = CoinsViewModel()
    
    var body: some View {
        List {
            ForEach(vm.coins) { coin in
                row(coin)
            }
        }
        .listStyle(.plain)
    }
    
    func row(_ coin: Coin) -> some View {
        HStack(spacing: 0) {
            Text("\(Int(coin.rank))")
                .foregroundStyle(.secondary)
                .frame(minWidth: 30)
            AsyncImage(url: URL(string: coin.image)) { image in
                image.image?.resizable()
                    .scaledToFit()
                    .frame(width: 30)
            }
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
            Spacer()
            VStack(alignment: .trailing) {
                Text("\(coin.currentPrice)" + "₽")
                    .bold()
                Text("\(coin.priceChangePercentage24H ?? 0)" + "%")
                    .foregroundStyle(
                        (coin.priceChangePercentage24H ?? 0) >= 0 ? Color.green : Color.red
                    )
            }
        }
    }
}

#Preview {
    CoinsView()
}
