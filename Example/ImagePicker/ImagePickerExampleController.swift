//
//  ImagePickerExampleController.swift
//  Example
//
//  Created by Irshad Ahmad on 05/07/22.
//

import UIKit
import UtilityPackage
import NetworkInterface

class ImagePickerExampleController: UIViewController {

    let viewModel = NetworkViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func clickOnShowDefault(_ sender: UIButton) {
        ImagePicker.shared.showImagePicker(from: nil) { pickedImage in
            if let image = pickedImage, let data = image.jpegData(compressionQuality: 0.5) {
                
            }
        }
    }
    
    @IBAction func clickOnGallery(_ sender: UIButton) {
        ImagePicker.shared.pickImage(from: .photoLibrary) { pickedImage in
            if let image = pickedImage, let data = image.jpegData(compressionQuality: 0.5) {
               
            }
        }
    }
}
