//
//  ImageProperties.swift
//  Networking
//
//  Created by Victor Kimpel on 21/03/2024.
//  Copyright © 2024 Victor Kimpel. All rights reserved.
//

import UIKit

struct ImageProperties {
    
    let key: String
    let data: Data
    
    init?(withImage image: UIImage, forKey key: String) {
        self.key = key
        guard let data = image.pngData() else { return nil }
        self.data = data
    }
}
