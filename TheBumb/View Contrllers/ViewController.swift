//
//  ViewController.swift
//  TheBumb
//
//  Created by Tasneem Dosoqi on 15/03/2020.
//  Copyright © 2020 Tasneem Dosoqi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var SignUpButton: UIButton!
    
    @IBOutlet weak var Logo: UIImageView!
    
    @IBOutlet weak var SignInButton: UIButton!
    @IBOutlet weak var upper: UIImageView!
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = true
    setUpElements()
        
    }
    
    
    func setUpElements() {
        
        Utilities.styleFilledButton(SignUpButton)
        Utilities.styleHollowButton(SignInButton)
        
    }


}

