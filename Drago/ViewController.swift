//
//  ViewController.swift
//  Drago
//
//  Created by Hamza Uzuner on 29.10.2020.
//  Copyright © 2020 Hamza Uzuner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var kayıtOlButton: UIButton!
    @IBOutlet weak var girisYapButton: UIButton!
    @IBOutlet weak var dragoLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       girisYapButton.layer.cornerRadius = girisYapButton.frame.height / 2
       kayıtOlButton.layer.cornerRadius = kayıtOlButton.frame.height / 2
    }

    @IBAction func girisYapButtonClicked(_ sender: Any) {
    }
    
    @IBAction func kayıtOlButtonClicked(_ sender: Any) {
    }
}

