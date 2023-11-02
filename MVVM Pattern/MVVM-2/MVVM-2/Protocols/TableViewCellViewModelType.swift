//
//  TableViewCellViewModelType.swift
//  MVVM-2
//
//  Created by Victor Kimpel on 3.11.23.
//

import Foundation

protocol TableViewCellViewModelType: AnyObject {
    var fullName: String { get }
    var age: String { get }
}
