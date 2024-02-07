//
//  SecondViewController.swift
//  CALayerDemo
//
//  Created by Victor Kimpel on 07/02/2024.
//  Copyright © 2024 Ivan Akulov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = imageView.frame.size.height / 2
            imageView.layer.masksToBounds = true
            let borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            imageView.layer.borderColor = borderColor.cgColor
            imageView.layer.borderWidth = 10
        }
    }
    
    @IBOutlet weak var button: UIButton! {
        didSet {
            button.layer.shadowOffset = CGSize(width: 0, height: 5)
            button.layer.shadowOpacity = 0.5
            button.layer.shadowRadius = 5
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

