//
//  ViewController.swift
//  TinkoffFinance
//
//  Created by Denis Nefedov on 24/09/2018.
//  Copyright © 2018 X. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController ,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var setPhotoButton: UIButton!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileDescLabel: UILabel!
    @IBOutlet weak var profileReductButton: UIButton!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        printEditButtonFrame(method: #function)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        printEditButtonFrame(method: #function)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        self.profileImage.layer.cornerRadius = CGFloat(25)
        self.profileImage.clipsToBounds = true;
        printEditButtonFrame(method: #function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
        /*
         Размер и расположение кнопки "Редактировать" в методах viewDidLoad() и
         viewDidAppear() отличаются, потому что до layout кнопка хранит значение frame
         результата вычесления layout во время компиляции.
         Layout происходит между viewDidLoad() и viewDidAppear(), потому что между временем
         их выполнения вызываются методы viewWillLayoutSubviews() и viewDidLayoutSubviews().
         */
        printEditButtonFrame(method: #function)
    }
    
    @IBAction func changeProfileImage(_ sender: Any) {
        print("Выберите изображение профиля")
        let alert = UIAlertController()
        let select = UIAlertAction(title: "Установить из галереи", style: .default){ _ in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                let imagePickerController = UIImagePickerController()
                imagePickerController.sourceType = .photoLibrary
                imagePickerController.allowsEditing = false
                imagePickerController.delegate = self
                self.present(imagePickerController, animated: true, completion: nil)
            }
        }
        let takeShot = UIAlertAction(title: "Сделать фото", style: .default){ _ in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                let imagePickerController = UIImagePickerController()
                imagePickerController.sourceType = .camera
                imagePickerController.allowsEditing = false
                imagePickerController.delegate = self
                self.present(imagePickerController, animated: true, completion: nil)
            }
        }
        let destroy = UIAlertAction(title: "Удалить фотографию", style: .destructive){ _ in
            self.profileImage.image = UIImage(named: "placeholder-user")
            self.profileImage.contentMode = .scaleAspectFit
        }
        let cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alert.addAction(select)
        alert.addAction(takeShot)
        alert.addAction(destroy)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            profileImage.contentMode = .scaleAspectFill
            profileImage.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
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
    
    
    func printEditButtonFrame(method: String){
        
        if let strongEditButton = profileReductButton{
            print("Кнопка \"Редактировать\", cвойство frame: \(strongEditButton.frame) во время выполнения метода \(method)")
        }else{
            print("Кнопка \"Редактировать\" ещё не инициализирована во время выполнения \(method)")
        }
    }
}
