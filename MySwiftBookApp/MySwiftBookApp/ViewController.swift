//
//  ViewController.swift
//  MySwiftBookApp
//
//  Created by Victor Kimpel on 18.11.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var infoLabel: UILabel!

    private var numberOfDays = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func datePicker(_ sender: UIDatePicker) {
        let range = sender.date..<Date.now
        numberOfDays = range.formatted(.components(style: .wide, fields: [.day]))
    }
    
    @IBAction func resultButtonTapped() {
        infoLabel.text = "Ты наслаждаешься жизнью уже \(numberOfDays)"
    }
    
}

