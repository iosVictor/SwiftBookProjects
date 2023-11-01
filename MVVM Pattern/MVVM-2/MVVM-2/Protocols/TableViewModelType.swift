//
//  TableViewModelType.swift
//  MVVM-2
//
//  Created by Victor Kimpel on 1.11.23.
//

import Foundation

protocol TableViewModelType {
    var numberOfRows: Int { get }
    var profiles: [Profile] { get }
}
