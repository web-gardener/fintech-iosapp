//
//  ConversationsListViewController.swift
//  TinkoffFinance
//
//  Created by Denis Nefedov on 08/10/2018.
//  Copyright © 2018 X. All rights reserved.
//

import UIKit

class ConversationsListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Оставляем только 60 поинтов торчащей вьюшки сбоку
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60
    }

}
