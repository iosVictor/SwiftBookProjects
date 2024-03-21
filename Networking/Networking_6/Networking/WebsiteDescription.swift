//
//  WebsiteDescription.swift
//  Networking
//
//  Created by Victor Kimpel on 21/03/2024.
//  Copyright © 2024 Victor Kimpel. All rights reserved.
//

import Foundation

struct WebsiteDescription: Decodable {
    
    let websiteDescription: String?
    let websiteName: String?
    let courses: [Course]
}
