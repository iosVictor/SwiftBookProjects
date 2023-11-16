//
//  ViewController.swift
//  ViewController. Single Responsibility Principle
//
//  Created by Victor Kimpel on 12.11.23.
//

import UIKit

class ViewController: UIViewController {

    
    // внешнин зависимости
//    var networkService = NetworkService()
    var dataFetcherService = DataFetcherService()
    let dataStore = DataStore()

    // элементы пользовательского интерфейса
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.cornerRadius = saveButton.frame.width / 2
        
        dataFetcherService.fetchCountry { countries in
            print(countries?.first?.Name)
        }
        
        dataFetcherService.fetchFreeGames { freeGames in
            print(freeGames?.feed.results.first?.name)
        }
        
        dataFetcherService.fetchNewGames { newGames in
            print(newGames?.feed.results.first?.name)
        }
        
        dataFetcherService.fetchLocalCountry { localCountries in
            print(localCountries?.last?.Name)
        }
    }
    
    // MARK: - Business logic
    
    // обработка имени
    func changeName() {
        guard let name = textLabel.text, name != "" else {
            showAlert()
            return
        }
        
        dataStore.savenameInCache(name: name)
    }
    
    // MARK: - User interface
    
    // отображение интерфейса
    func showAlert() {
        let alert = UIAlertController(title: "WARNING", message: "Your name can't be empty.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okey", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true)
    }

    // Взаимодействие пользователя с интерфейсом
    @IBAction func changeLabel(_ sender: Any) {
        textLabel.text = myTextField.text
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        changeName()
    }

}

