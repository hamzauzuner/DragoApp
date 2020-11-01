//
//  HomepageTableViewCell.swift
//  Drago
//
//  Created by Hamza Uzuner on 31.10.2020.
//  Copyright © 2020 Hamza Uzuner. All rights reserved.
//

import UIKit
import Firebase

class HomepageTableViewCell: UITableViewCell {

    
    @IBOutlet weak var documentIdLabel: UILabel!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var userMailLabel: UILabel!
    @IBOutlet weak var subjectLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func likeButton(_ sender: Any) {
        let firestoreDatabase = Firestore.firestore()
        if let likeCount = Int(likeCountLabel.text!) {
            let likeStore = ["likes" : likeCount+1] as [String:Any]
            firestoreDatabase.collection("Posts").document(documentIdLabel.text!).setData(likeStore, merge: true)
        }
        
    }
}
