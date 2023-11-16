//
//  DataFetcherService.swift
//  ViewController. Single Responsibility Principle
//
//  Created by Victor Kimpel on 16.11.23.
//

import Foundation

class DataFetcherService {
    
    var networkDataFetcher: DataFetcher
    var localDataFetcher: DataFetcher
    
    init(networkDataFetcher: DataFetcher = NetworkDataFetcher(), localDataFetcher: DataFetcher = LocalDataFetcher()) {
        self.networkDataFetcher = networkDataFetcher
        self.localDataFetcher = localDataFetcher
    }
    
    func fetchNewGames(completion: @escaping (AppGroup?) -> Void) {
        let urlNewGames = "https://rss.applemarketingtools.com/api/v2/us/apps/top-paid/10/apps.json"
        networkDataFetcher.fetchGenericJSONData(urlString: urlNewGames, response: completion)
    }
    
    func fetchFreeGames(completion: @escaping (AppGroup?) -> Void) {
        let urlFreeGames = "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/10/apps.json"
        networkDataFetcher.fetchGenericJSONData(urlString: urlFreeGames, response: completion)
    }
    
    func fetchCountry(completion: @escaping ([Country]?) -> Void) {
        let urlString = "https://raw.githubusercontent.com/Softex-Group/task-mobile/master/test.json"
        networkDataFetcher.fetchGenericJSONData(urlString: urlString, response: completion)
    }
    
    func fetchLocalCountry(completion: @escaping ([Country]?) -> Void) {
        let localUrlString = "usersAPI.txt"
        localDataFetcher.fetchGenericJSONData(urlString: localUrlString, response: completion)
    }
}
