//
//  MovieModel.swift
//  WisdomLeaf
//
//  Created by Venkata Hanumantharao Nagendla on 9/20/24.
//

import Foundation

// Model for individual movie
struct MovieModel: Codable {
    let title: String
    let year: String
    let imdbID: String
    let type: String
    let poster: String
    var isFavorite: Bool = false // Add this property

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID = "imdbID"
        case type = "Type"
        case poster = "Poster"

    }
}

// Model for the entire API response
struct MovieResponse: Codable {
    let search: [MovieModel]
    let totalResults: String
    let response: String
    let error: String? // Handle possible errors from the API

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
        case error = "Error"

    }
}
