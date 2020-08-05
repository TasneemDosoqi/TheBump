//
//  TableViewCellAdmin.swift
//  TheBump-v1
//
//  Created by rahaf  on 20/03/2020.
//  Copyright © 2020 rahaf. All rights reserved.
//

import UIKit

class TableViewCellAdmin: UITableViewCell {
 
    
    @IBOutlet weak var theQuestionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(faq: AskedQuestions){
        theQuestionLabel.text = faq.Question
        
    }
    
}

