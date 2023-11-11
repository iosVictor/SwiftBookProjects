//
//  DetailViewModelType.swift
//  MVVM-2
//
//  Created by Victor Kimpel on 7.11.23.
//

import Foundation

protocol DetailViewModelType {
    var description: String { get }
    var age: Box<String?> { get }
}
