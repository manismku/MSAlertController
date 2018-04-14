//
//  ViewController.swift
//  MSAlertControllerExample
//
//  Created by manish kumar on 28/02/18.
//  Copyright © 2018 Manish Kumar. All rights reserved.
//

import UIKit
import MSAlertController

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        for family in UIFont.familyNames
        {
            print("\(family)")
            for names in UIFont.fontNames(forFamilyName: family)
            {
                print("== \(names)")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func showAlert(_ sender: Any) {
        //let vc = MSAlertController(title: "INSTAGRAM", message: "Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!!")
        
         //let vc = MSAlertController(title: "INSTAGRAM", message: "Happy Coding!! Happy Coding!! Happy Coding!!")
         //let vc = MSAlertController(title: "INSTAGRAM", message: "Lets meet at Park Square!!",  preferredStyle: .MSAlertControllerStyleShowMoreList)

        var apr = Appearance.createTheme(theme: .grey)
        apr.titleAllignment = .centre

        let vc = MSAlertController(title: "NEARME", message: "You are near Fisherman's Wharf.", appearance: apr)

        //let vc = MSAlertController(title: "MESSAGE", message: "Hey!! Let's meet at Market-Square.",sideView: UIImageView.init(image: UIImage(named: "avatar")))

        let viewAction = MSAlertAction(title: "Open Map") {
            self.dismiss(animated: true, completion: nil)
        }

        let cameraAction = MSAlertAction(title: "Take Photo") {
            [weak self] in            
            self?.actionLaunchCamera()
        }
        vc.addAction(action: viewAction)
        vc.addAction(action: cameraAction)
        self.present(vc, animated: false, completion: nil)
    }

    func actionLaunchCamera()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)
        {
            let imagePicker:UIImagePickerController = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker.allowsEditing = true

            self.present(imagePicker, animated: false, completion: nil)
        }
    }
}

