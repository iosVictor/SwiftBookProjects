//
//  ViewModel.swift
//  MVVM-1
//
//  Created by Victor Kimpel on 29.10.23.
//

import Foundation

class ViewModel {
    
    private var profile = Profile(name: "John", secondName: "Appleceed", age: 35)
    
    var name: String {
        return profile.name
    }
    
    var secondName: String {
        return profile.secondName
    }
    
    var age: String {
        return String(describing: profile.age)
    }
}
