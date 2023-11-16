//
//  ViewController.swift
//  ViewController. Single Responsibility Principle
//
//  Created by Victor Kimpel on 12.11.23.
//

import UIKit

class ViewController: UIViewController {
    
    let urlString = "https://raw.githubusercontent.com/Softex-Group/task-mobile/master/test.json"
    
    let urlFreeGames = "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/10/apps.json"
    
    let urlNewGames = "https://rss.applemarketingtools.com/api/v2/us/apps/top-paid/10/apps.json"
    
    // внешнин зависимости
//    var networkService = NetworkService()
    var networkDataFetcher = NetworkDataFetcher()
    let dataStore = DataStore()

    // элементы пользовательского интерфейса
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.cornerRadius = saveButton.frame.width / 2
        
        networkDataFetcher.fetchNewGames(urlString: urlNewGames) { newGames in
            print(newGames?.feed.results.first?.name)
        }
        
        networkDataFetcher.fetchFreeGames(urlString: urlFreeGames) { freeGames in
            print(freeGames?.feed.results.first?.name)
        }
        
        networkDataFetcher.fetchCountry(urlString: urlString) { countries in
            print(countries?.first?.Name)
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

