//
//  ViewModel.swift
//  MVVM-2
//
//  Created by Victor Kimpel on 1.11.23.
//

import Foundation

class ViewModel: TableViewViewModelType {

    private var selectedIndexPath: IndexPath?
    
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
    
    func viewModelForSelectedRow() -> DetailViewModelType? {
        guard let selectedIndexPath = selectedIndexPath else { return nil }
        return DetailViewModel(profile: profiles[selectedIndexPath.row])
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
}
