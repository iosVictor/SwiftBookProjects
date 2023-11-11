//
//  NetworkManager.swift
//  MVVM-3
//
//  Created by Victor Kimpel on 11.11.23.
//

import Foundation

class NetworkManager: NSObject {
    
    func fetchMovies(completion: ([String]) -> ()) {
        completion(["Movie 1", "Movie 2", "Movie 3"])
    }
}
