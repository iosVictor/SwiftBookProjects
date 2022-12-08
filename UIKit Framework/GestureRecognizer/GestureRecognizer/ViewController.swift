//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by Victor Kimpel on 3.12.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        swipesObservers()
        tapObserver()
    }

    func swipesObservers() {
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    func tapObserver() {
        
        let tripleTap = UITapGestureRecognizer(target: self, action: #selector(tripleTapAction))
        tripleTap.numberOfTapsRequired = 3
        self.view.addGestureRecognizer(tripleTap)
        
        let dowbleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapAction))
        dowbleTap.require(toFail: tripleTap)
        dowbleTap.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(dowbleTap)
    }
    
    @objc func handleSwipes(gester: UISwipeGestureRecognizer) {
        
        switch gester.direction {
        case .right:
            label.text = "Right swipe was recognized"
        case .left:
            label.text = "Left swipe was recognized"
        case .up:
            label.text = "Up swipe was recognized"
        case .down:
            label.text = "Down swipe was recognized"
        default:
            break
        }
    }
    
    @objc func tripleTapAction() {
        label.text = "Triple taped was recognized"
    }
    
    @objc func doubleTapAction() {
        label.text = "Dowble taped was recognized"
    }
    

}

