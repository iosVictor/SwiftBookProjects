//
//  DetailViewModel.swift
//  MVVM-2
//
//  Created by Victor Kimpel on 7.11.23.
//

import Foundation

class DetailViewModel: DetailViewModelType {
    
    private var profile: Profile
    
    var description: String {
        return String(describing: "\(profile.name) \(profile.secondName) is \(profile.age) old")
    }
    
    init(profile: Profile) {
        self.profile = profile
    }
}
