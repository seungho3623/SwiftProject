//
//  ViewController.swift
//  QuotesGenerator
//
//  Created by 송승호 on 2024/01/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    let quotes = [
        Quote(contents: "명언 1", name: "명언가 1"),
        Quote(contents: "명언 2", name: "명언가 2"),
        Quote(contents: "명언 3", name: "명언가 3"),
        Quote(contents: "명언 4", name: "명언가 4"),
        Quote(contents: "명언 5", name: "명언가 5")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func tabQuoteGeneratorButton(_ sender: Any) {
        let random = Int(arc4random_uniform(5)) //0 ~ 4 난수 생성
        let quote = quotes[random]
        
        self.quoteLabel.text = quote.contents
        self.nameLabel.text = quote.name
    }
}

