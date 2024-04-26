//
//  ServerManager.swift
//  M4Exercise
//
//  Created by Sofia Shchukina on 29.07.2023.
//

import Foundation

/// A singleton class responsible for fetching dish data from a remote JSON API.
/// It handles the network request, data decoding, and returns an array of `MenuItem` objects.
final class ServerManager {

    static var shared = ServerManager()

    func getDishes() async -> [MenuItem] {
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/littleLemonSimpleMenu.json")!
        let urlSession = URLSession.shared
        do {
            let (data, _) = try await urlSession.data(from: url)
            let jsonMenu = try JSONDecoder().decode(JSONMenu.self, from: data)
            return jsonMenu.menuItems
        } catch {
            print("error during decoding: \(error)")
            return []
        }
    }
}
