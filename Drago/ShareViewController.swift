//
//  ShareViewController.swift
//  Drago
//
//  Created by Hamza Uzuner on 31.10.2020.
//  Copyright © 2020 Hamza Uzuner. All rights reserved.
//

import UIKit
import Firebase


class ShareViewController: UIViewController, UITextViewDelegate {

    
    @IBOutlet weak var düşüncelerTextView: UITextView!
    @IBOutlet weak var paylaşButton: UIButton!
    @IBOutlet weak var konuTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        düşüncelerTextView.delegate = self
        düşüncelerTextView.text = "Düşüncelerinizi buraya yazınız"
        düşüncelerTextView.textColor = UIColor.lightGray

        // Do any additional setup after loading the view.
        paylaşButton.layer.cornerRadius = paylaşButton.frame.height / 2
        var borderColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        düşüncelerTextView.layer.borderWidth = 1
        düşüncelerTextView.layer.borderColor = borderColor.cgColor
        düşüncelerTextView.layer.cornerRadius = 5.0
        

    }
    
    @IBAction func paylaşButtonClicked(_ sender: Any) {
        
        let firestoreDatabase = Firestore.firestore()
        var firestoreReference : DocumentReference? = nil
        
        let firestorePost = ["postedBy":Auth.auth().currentUser!.email!, "subject": konuTextField.text!, "description": düşüncelerTextView.text!, "date" : FieldValue.serverTimestamp(), "likes" : 0] as [String:Any]
        
        
        firestoreReference = firestoreDatabase.collection("Posts").addDocument(data: firestorePost, completion: { (error) in
            if error != nil{
                self.makeAlert(messageInput: error?.localizedDescription ?? "Hata")
                
            }else{
                self.konuTextField.text = ""
                self.düşüncelerTextView.text = "Düşüncelerinizi buraya yazınız..."
                self.tabBarController?.selectedIndex = 0
            }
        })
        
    }
    func makeAlert (messageInput:String)  {
           let alert = UIAlertController(title: "Hata", message: messageInput, preferredStyle: UIAlertController.Style.alert)
           let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
           alert.addAction(okButton)
           present(alert, animated: true, completion: nil)
   
  
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Düşüncelerinizi buraya yazınız"
            textView.textColor = UIColor.lightGray
        }
    }
 
}
