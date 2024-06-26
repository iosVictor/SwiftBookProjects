//
//  Course.swift
//  Networking
//
//  Created by Victor Kimpel on 21/03/2024.
//  Copyright © 2024 Victor Kimpel. All rights reserved.
//

import Foundation

/*
struct Course: Decodable {
    
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?
    let numberOfLessons: Int?
    let numberOfTests: Int?
}
*/

struct Course: Decodable {
    
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?
    let numberOfLessons: String?
    let numberOfTests: String?
    
    init?(json: [String: Any]) {
        
        let id = json["id"] as? Int
        let name = json["name"] as? String
        let link = json["link"] as? String
        let imageUrl = json["imageUrl"] as? String
        let numberOfLessons = json["numberOfLessons"] as? String
        let numberOfTests = json["numberOfTests"] as? String
        
        self.id = id
        self.name = name
        self.link = link
        self.imageUrl = imageUrl
        self.numberOfLessons = numberOfLessons
        self.numberOfTests = numberOfTests
    }
    
    static func getArray(from jsonArray: Any) -> [Course]? {
        
        guard let jsonArray = jsonArray as? Array<[String: Any]> else { return nil }
        return jsonArray.compactMap { Course(json: $0) }
        
    }
}

