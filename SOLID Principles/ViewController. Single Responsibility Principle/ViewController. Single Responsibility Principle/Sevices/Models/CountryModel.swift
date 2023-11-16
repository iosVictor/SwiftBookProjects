//
//  CountryModel.swift
//  ViewController. Single Responsibility Principle
//
//  Created by Victor Kimpel on 16.11.23.
//

import Foundation

struct Country: Decodable {
    var Id: String
    var Time: String
    var Name: String
    var Image: String?
}
