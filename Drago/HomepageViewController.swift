//
//  HomepageViewController.swift
//  Drago
//
//  Created by Hamza Uzuner on 31.10.2020.
//  Copyright © 2020 Hamza Uzuner. All rights reserved.
//

import UIKit
import Firebase
class HomepageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var userMailArray = [String]()
    var subjectArray = [String]()
    var descriptionArray = [String]()
    var likeArray = [Int]()
    var documentIdArray = [String]()
    
    
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userMailArray.count
    }
    
   
    
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
         
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        
        getDataFromFirebase()
    }
    
    
    func getDataFromFirebase() {
        let firestoreDatabase = Firestore.firestore()
        
        firestoreDatabase.collection("Posts").order(by: "date", descending: true).addSnapshotListener { (snapshot, error) in
            if error != nil {
                print(error?.localizedDescription)
            }else {
                if snapshot?.isEmpty != true && snapshot != nil {
                    
                    self.userMailArray.removeAll(keepingCapacity: false)
                    self.subjectArray.removeAll(keepingCapacity: false)
                    self.descriptionArray.removeAll(keepingCapacity: false)
                    self.likeArray.removeAll(keepingCapacity: false)
                    self.documentIdArray.removeAll(keepingCapacity: false)
                    
                    
                    
                    for document in snapshot!.documents {
                        let documentID = document.documentID
                        self.documentIdArray.append(documentID)
                    
                        if let postedBy = document.get("postedBy") as? String {
                            self.userMailArray.append(postedBy)
                        }
                        if let subject = document.get("subject") as? String {
                            self.subjectArray.append(subject)
                        }
                        if let description = document.get("description") as? String {
                            self.descriptionArray.append(description)
                        }
                        if let like = document.get("likes") as? Int {
                            self.likeArray.append(like)
                        }
                       
                    }
                    self.tableView.reloadData()
                    
                    
                }
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HomepageTableViewCell
        cell.userMailLabel.text = userMailArray[indexPath.row]
        cell.subjectLabel.text = subjectArray[indexPath.row]
        cell.descriptionLabel.text = descriptionArray[indexPath.row]
        cell.documentIdLabel.text = documentIdArray[indexPath.row]
        cell.likeCountLabel.text = String(likeArray[indexPath.row])
        return cell
        
        
        
        
    }
    }


