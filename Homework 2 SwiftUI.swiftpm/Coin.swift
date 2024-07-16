import Foundation

struct Coin: Identifiable, Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCapRank: Double?
    let priceChangePercentage24H: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCapRank = "market_cap_rank"
        case priceChangePercentage24H = "price_change_percentage_24h"
    }
    
    var rank: Int {
            return Int(marketCapRank ?? 0)
        }
}


