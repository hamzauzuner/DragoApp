//
//  SignUpViewController.swift
//  Drago
//
//  Created by Hamza Uzuner on 31.10.2020.
//  Copyright © 2020 Hamza Uzuner. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var epostaTextField: UITextField!
    @IBOutlet weak var kayıtOlButton: UIButton!
    @IBOutlet weak var şifreTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        

        kayıtOlButton.layer.cornerRadius = kayıtOlButton.frame.height / 2
    }
    

    @IBAction func kayıtOlButtonClicked(_ sender: Any) {
        
        if epostaTextField.text != "" && şifreTextField.text != "" {
            Auth.auth().createUser(withEmail: epostaTextField.text!, password: şifreTextField.text!) { (data, error) in
                       if error != nil{
                        self.makeAlert(messageInput: error?.localizedDescription ?? "Hata")
                       }else{
                        self.performSegue(withIdentifier: "toHomepage", sender: nil)
                       }
            } } else {
            makeAlert(messageInput: "Eksik e-posta adresi ya da şifre girişi yaptınız. Lütfen tekrar deneyiniz.")

            }
       
        }
    func makeAlert (messageInput:String)  {
        let alert = UIAlertController(title: "Hata", message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
        
    }
    }

