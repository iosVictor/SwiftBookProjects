//
//  ViewModel.swift
//  MVVM-2
//
//  Created by Victor Kimpel on 1.11.23.
//

import Foundation

class ViewModel: TableViewViewModelType {
    
    var profiles = [Profile(name: "John", secondName: "Appleceed", age: 35),
                    Profile(name: "Max", secondName: "Kolby", age: 33),
                    Profile(name: "Dick", secondName: "Dickenson", age: 38)]
    
    func numberOfRows() -> Int {
        return profiles.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType? {
        let profile = profiles[indexPath.row]
        return TableViewCellViewModel(profile: profile)
    }
}
