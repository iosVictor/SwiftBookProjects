//
//  DetailViewController.swift
//  MVVM-2
//
//  Created by Victor Kimpel on 7.11.23.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    var viewModel: DetailViewModelType?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let viewModel = viewModel else { return }
        self.textLabel.text = viewModel.description
    }
}
