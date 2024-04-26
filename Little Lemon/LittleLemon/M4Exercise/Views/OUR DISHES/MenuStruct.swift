import Foundation
import CoreData

/// Represents a JSON structure containing menu items.
struct JSONMenu: Codable {
    let menuItems: [MenuItem]
    
    enum CodingKeys: String, CodingKey {
        case menuItems = "menu"
    }
}


struct MenuItem: Codable, Identifiable {
    var id: Int
    let title: String
    let price: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case price
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        price = try container.decode(String.self, forKey: .price)
    }
}
