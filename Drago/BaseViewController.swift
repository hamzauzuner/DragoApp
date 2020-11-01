//
//  BaseViewController.swift
//  Drago
//
//  Created by Hamza Uzuner on 1.11.2020.
//  Copyright © 2020 Hamza Uzuner. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

 func makeAlertBase(messageInput:String) {
        let alert = UIAlertController(title: "Hata", message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
        
    }

}
