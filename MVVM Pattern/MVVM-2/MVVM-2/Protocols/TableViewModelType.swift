//
//  TableViewModelType.swift
//  MVVM-2
//
//  Created by Victor Kimpel on 1.11.23.
//

import Foundation

protocol TableViewViewModelType {
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType?
}
