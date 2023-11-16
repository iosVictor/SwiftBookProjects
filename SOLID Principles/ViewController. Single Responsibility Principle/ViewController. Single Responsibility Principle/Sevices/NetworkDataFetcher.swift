//
//  NetworkDataFetcher.swift
//  ViewController. Single Responsibility Principle
//
//  Created by Victor Kimpel on 16.11.23.
//

import Foundation

class NetworkDataFetcher {
    
    var networkService = NetworkService()
    
    init(networkService: NetworkService = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchNewGames(urlString: String, completion: @escaping (AppGroup?) -> Void) {
        networkService.request(urlString: urlString) { data, error in
            let decoder = JSONDecoder()
            guard let data = data else { return }
            let response = try? decoder.decode(AppGroup.self, from: data)
            completion(response)
        }
    }
    
    func fetchFreeGames(urlString: String, completion: @escaping (AppGroup?) -> Void) {
        networkService.request(urlString: urlString) { data, error in
            let decoder = JSONDecoder()
            guard let data = data else { return }
            let response = try? decoder.decode(AppGroup.self, from: data)
            completion(response)
        }
    }
    
    // декодируем полученные JSON данные в конернтную модель данных
    func fetchCountry(urlString: String, completion: @escaping ([Country]?) -> Void) {
        networkService.request(urlString: urlString) { data, error in
            let decoder = JSONDecoder()
            guard let data = data else { return }
            let response = try? decoder.decode([Country].self, from: data)
            completion(response)
        }
    }
    
}
