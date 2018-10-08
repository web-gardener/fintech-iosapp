//
//  ConversationViewController.swift
//  TinkoffFinance
//
//  Created by Denis Nefedov on 08/10/2018.
//  Copyright © 2018 X. All rights reserved.
//

import UIKit

class ConversationViewController: UIViewController {
    /* OUTLETS */
    @IBOutlet weak var menuBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       /* Метод для менюшки сбоку
          
         */ menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
    }

}
