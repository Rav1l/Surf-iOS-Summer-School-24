import Foundation
import Combine

class CoinsViewModel: ObservableObject {
    
    @Published var coins: [Coin] = []
    var cancellables = Set<AnyCancellable>()
    init() {
        getCoins()
    }
    
    func getCoins() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=rub&order=market_cap_desc&per_page=50&sparkline=true&price_change_percentage=1") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap { (data, response) -> Data in
                guard
                    let response = response as? HTTPURLResponse,
                    response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [Coin].self, decoder: JSONDecoder())
            .sink { (complition) in
                print("Complition: \(complition)")
            } receiveValue: { [weak self] returnedCoins in
                self?.coins = returnedCoins
            }
            .store(in: &cancellables)
    }
}
