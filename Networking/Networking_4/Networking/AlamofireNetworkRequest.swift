//
//  AlamofireNetworkRequest.swift
//  Networking
//
//  Created by Victor Kimpel on 21.03.24.
//  Copyright © 2024 Victor Kimpel. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireNetworkRequest {
    
    static func sendRequest(url: String) {
        
        guard let url = URL(string: url) else { return }
        
        request(url, method: .get).responseJSON { response in
            
            switch response.result {
                
            case .success(let value):
                print(value)
            case .failure(let error):
                print(error)
            }
        }
    }
}
