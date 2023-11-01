//
//  ViewModel.swift
//  MVVM-2
//
//  Created by Victor Kimpel on 1.11.23.
//

import Foundation

class ViewModel: TableViewModelType {
    
    var profiles = [Profile(name: "John", secondName: "Appleceed", age: 35),
                    Profile(name: "Max", secondName: "Kolby", age: 33),
                    Profile(name: "Dick", secondName: "Dickenson", age: 38)]
    
    var numberOfRows: Int {
        return profiles.count
    }
}
