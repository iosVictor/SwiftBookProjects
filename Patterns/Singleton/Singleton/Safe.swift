//
//  Safe.swift
//  Singleton
//
//  Created by Victor Kimpel on 29.09.23.
//

class Safe {
    
    var money = 0
    static let shared = Safe()
    
    private init() {}
}
