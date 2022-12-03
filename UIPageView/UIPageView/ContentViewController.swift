//
//  ContentViewController.swift
//  UIPageView
//
//  Created by Victor Kimpel on 3.12.22.
//

import UIKit

class ContentViewController: UIViewController {

    @IBOutlet weak var presentTextLabel: UILabel!
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var presentText = ""
    var emoji = ""
    var curentPage = 0 // Номер текущей страницы
    var numberOfPages = 0 // Количество страниц
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presentTextLabel.text = presentText
        emojiLabel.text = emoji
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPage = curentPage
    }

}
