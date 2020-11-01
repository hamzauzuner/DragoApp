//
//  ProfileViewController.swift
//  Drago
//
//  Created by Hamza Uzuner on 31.10.2020.
//  Copyright © 2020 Hamza Uzuner. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

    @IBOutlet weak var çıkışYapButton: UIButton!
    @IBOutlet weak var epostaLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        çıkışYapButton.layer.cornerRadius = çıkışYapButton.frame.height / 2
        epostaLabel.text = "E-posta Adresi : \(Auth.auth().currentUser!.email!)"

    }
    
    @IBAction func çıkışYapButtonClicked(_ sender: Any) {
        
    }
    
    
    

}
