//
//  APIService.swift
//  WisdomLeaf
//
//  Created by Venkata Hanumantharao Nagendla on 9/20/24.
//

import Foundation

class APIService {
    static func fetchMovies(completion: @escaping (Result<[MovieModel], Error>) -> Void) {
        let urlString = "https://www.omdbapi.com/?apikey=64e5c48a&type=movie&s=Don"

        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL."])))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received."])))
                return
            }

            do {
                let result = try JSONDecoder().decode(MovieResponse.self, from: data)
                
                // Check if there's an error message in the response
                if let errorMessage = result.error {
                    completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: errorMessage])))
                } else if !result.search.isEmpty {
                    completion(.success(result.search)) // Return the list of movies
                } else {
                    completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No movies found."])))
                }
            } catch {
                print("Decoding error: \(error)") // Print error for debugging
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
