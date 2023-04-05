//
//  SecondViewController.swift
//  GCD
//
//  Created by Victor Kimpel on 5.04.23.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    fileprivate var imageURL: URL?
    fileprivate var image: UIImage? {
        get {
            return imageView.image
        }
        
        set {
            activityIndicator.startAnimating()
            activityIndicator.isHidden = true
            imageView.image = newValue
            imageView.sizeToFit()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchImage()
        delay(3) {
            self.loginAlert()
        }
    }
    
    fileprivate func delay(_ delay: Int, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay)) {
            closure()
        }
    }
    
    fileprivate func loginAlert() {
        let ac = UIAlertController(title: "Зарегестрированы?", message: "Введите ваш логин и пароль", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        let cancelAction = UIAlertAction(title: "Отмена", style: .default)
        
        ac.addAction(okAction)
        ac.addAction(cancelAction)
        
        ac.addTextField { usernameTF in
            usernameTF.placeholder = "Введите логин"
        }
        
        ac.addTextField { userPasswordTF in
            userPasswordTF.placeholder = "Введите пароль"
            userPasswordTF.isSecureTextEntry = true
        }
        
        self.present(ac, animated: true)
    }
    
    fileprivate func fetchImage() {
        imageURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/07/Huge_ball_at_Vilnius_center.jpg")
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            guard let url = self.imageURL, let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: imageData)
            }
        }
    }
}
