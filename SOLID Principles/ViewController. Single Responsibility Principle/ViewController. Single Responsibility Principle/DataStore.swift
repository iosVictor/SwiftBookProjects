//
//  DataStore.swift
//  ViewController. Single Responsibility Principle
//
//  Created by Victor Kimpel on 12.11.23.
//

import Foundation

class DataStore {
    
    // сохранение данных в кеш/базу данных
    func savenameInCache(name: String) {
        print("Your name: \(name) is saved")
    }
    
    // получать данные из кеша/базы данных
    func getNameFromCache() -> String {
        return "some name"
    }
}
