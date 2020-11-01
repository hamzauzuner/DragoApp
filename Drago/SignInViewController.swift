//
//  SignInViewController.swift
//  Drago
//
//  Created by Hamza Uzuner on 31.10.2020.
//  Copyright © 2020 Hamza Uzuner. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController:BaseViewController {
    
    @IBOutlet weak var epostaTextField: UITextField!
    @IBOutlet weak var girisYapButton: UIButton!
    @IBOutlet weak var şifreTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        girisYapButton.layer.cornerRadius = girisYapButton.frame.height / 2
        // Do any additional setup after loading the view.
    }
    
    @IBAction func girisYapButtonClicked(_ sender: Any) {
        if epostaTextField.text != "" && şifreTextField.text != "" {
            Auth.auth().signIn(withEmail: epostaTextField.text!, password: şifreTextField.text!) { (authdata, error) in
                if error != nil{
                    self.makeAlertBase(messageInput: error?.localizedDescription ?? "Hata")
                }else{
                    self.performSegue(withIdentifier: "toHomepageVC", sender: nil)
                }
            }
            
        }else {
            makeAlert(messageInput: "Eksik e-posta adresi ya da şifre girişi yaptınız. Lütfen tekrar deneyiniz.")
            
            
        }
        
    }
    func makeAlert(messageInput:String) {
        let alert = UIAlertController(title: "Hata", message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
        
    }
}



