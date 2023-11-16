//
//  DataFetcherService.swift
//  ViewController. Single Responsibility Principle
//
//  Created by Victor Kimpel on 16.11.23.
//

import Foundation

class DataFetcherService {
    
    var dataFetcher: DataFetcher
    
    init(dataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.dataFetcher = dataFetcher
    }
    
    func fetchNewGames(completion: @escaping (AppGroup?) -> Void) {
        let urlNewGames = "https://rss.applemarketingtools.com/api/v2/us/apps/top-paid/10/apps.json"
        dataFetcher.fetchGenericJSONData(urlString: urlNewGames, response: completion)
    }
    
    func fetchFreeGames(completion: @escaping (AppGroup?) -> Void) {
        let urlFreeGames = "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/10/apps.json"
        dataFetcher.fetchGenericJSONData(urlString: urlFreeGames, response: completion)
    }
    
    func fetchCountry(completion: @escaping ([Country]?) -> Void) {
        let urlString = "https://raw.githubusercontent.com/Softex-Group/task-mobile/master/test.json"
        dataFetcher.fetchGenericJSONData(urlString: urlString, response: completion)
    }
}
