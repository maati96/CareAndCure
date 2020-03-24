//
//  OrderTreatmentVC.swift
//  CareAndCure
//
//  Created by Mohamed M3aty on 3/22/20.
//  Copyright © 2020 Mohamed M3aty. All rights reserved.
//

import UIKit

class OrderTreatmentVC: UIViewController {

    @IBOutlet weak var imgeView: UIImageView! {
        didSet {
            imgeView.layer.borderWidth = 1
            imgeView.layer.borderColor = UIColor.black.cgColor
            imgeView.layer.masksToBounds = false
            imgeView.layer.cornerRadius = imgeView.frame.height / 2
            imgeView.clipsToBounds = true
        }
    }
    @IBOutlet weak var treatementBtn: UIButton! {
        didSet {
            treatementBtn.setBackgroundImage(UIImage(systemName: "photo.fill"), for: .focused)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func orderTreatmentPressed(_ sender: UIButton) {
        print("Treatement pressed")
        showImagePickerControllerActionSheet()
    }
  
    

}

extension OrderTreatmentVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func showImagePickerControllerActionSheet() {
        let photoLibraryAction = UIAlertAction(title: "Choose from library", style: .default) { (action) in
            self.showImagePicker(socureImage: .photoLibrary)
        }
        let photoCamiraAction = UIAlertAction(title: "Choose from camira", style: .default) { (action) in
            self.showImagePicker(socureImage: .camera)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        self.showAlert(style: .actionSheet, title: "Choose Your Image", message: nil, actions: [photoLibraryAction, photoCamiraAction, cancelAction], completion: nil)
    }
    
    func showImagePicker(socureImage: UIImagePickerController.SourceType)  {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let Editedimage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            imgeView.image = Editedimage
        } else if  let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imgeView.image = originalImage
        }
        dismiss(animated: true, completion: nil)
    }
}

