//
//  ViewController.swift
//  Singleton
//
//  Created by Victor Kimpel on 29.09.23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let safe = Safe.shared
        print(safe.money)
        
    }
}

