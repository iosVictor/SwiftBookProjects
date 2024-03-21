//
//  Course.swift
//  Networking
//
//  Created by Victor Kimpel on 21.03.2024.
//  Copyright © 2024 Victor Kimpel. All rights reserved.
//

import Foundation

struct Course: Decodable {
    
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?
    let numberOfLessons: Int?
    let numberOfTests: Int?
}
