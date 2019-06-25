//
//  AddPhotoViewController.swift
//  ViewFinder
//
//  Created by Apple on 6/24/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit


class AddPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
   
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var Caption: UITextField!
    
    @IBAction func cameraTapped(_ sender: Any) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func albumTapped(_ sender: Any) {  imagePicker.sourceType = .savedPhotosAlbum
        present(imagePicker, animated:true, completion: nil)
    }
    
    @IBAction func savePhotoTapped(_ sender: UIButton) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            let photoToSave = Photos(entity: Photos.entity(), insertInto: context)
            photoToSave.caption = Caption.text
            
            if let userImage = imageView.image {
              
            if let userImageData = userImage.pngData(){
                photoToSave.imageData = userImageData
                
            }
        }
    (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
      navigationController?.popViewController(animated: true)
        }
    }
    

    func imagePickerController(_picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = selectedImage
            imagePicker.dismiss(animated: true, completion: nil)
        }
    }
}

