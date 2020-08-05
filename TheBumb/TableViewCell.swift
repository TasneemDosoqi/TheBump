//
//  TableViewCell.swift
//  TheBump-v1
//
//  Created by rahaf  on 17/03/2020.
//  Copyright © 2020 rahaf. All rights reserved.
//

import UIKit
 
class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(faq: Community){
        questionLabel.text = faq.Question
        answerLabel.text = faq.Answer
    }
    
}
