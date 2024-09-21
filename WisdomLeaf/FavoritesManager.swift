//
//  FavoritesManager.swift
//  WisdomLeaf
//
//  Created by Venkata Hanumantharao Nagendla on 9/20/24.
//

import Foundation

class FavoritesManager {
    private let favoritesKey = "favoriteMovies"

    // Save favorites to UserDefaults
    func saveFavorites(movies: [MovieModel]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(movies) {
            UserDefaults.standard.set(encoded, forKey: favoritesKey)
        }
    }

    // Load favorites from UserDefaults
    func loadFavorites() -> [MovieModel] {
        if let data = UserDefaults.standard.data(forKey: favoritesKey),
           let decoded = try? JSONDecoder().decode([MovieModel].self, from: data) {
            return decoded
        }
        return []
    }
}
