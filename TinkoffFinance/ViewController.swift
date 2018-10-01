//
//  ViewController.swift
//  TinkoffFinance
//
//  Created by Denis Nefedov on 24/09/2018.
//  Copyright © 2018 X. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    struct DesignConstants{
        static let profileImageRadius = CGFloat(40)
        static let bordedButtonRadius = CGFloat(16)
        static let bordedButtonBorderWidth = CGFloat(1)
    }
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var setPhotoButton: UIButton!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileDescLabel: UILabel!
    @IBOutlet weak var profileReductButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        self.profileImage.layer.cornerRadius = CGFloat(25)
        self.profileImage.clipsToBounds = true;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(#function)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(#function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
    }
}
