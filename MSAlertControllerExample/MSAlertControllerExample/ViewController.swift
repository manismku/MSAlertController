//
//  ViewController.swift
//  MSAlertControllerExample
//
//  Created by manish kumar on 28/02/18.
//  Copyright © 2018 Manish Kumar. All rights reserved.
//

import UIKit
import MSAlertController

class ViewController: UIViewController {

    
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

        //let vc = MSAlertController(title: "INSTAGRAM", message: "Meet me at Park Square!!", appearance: apr, sideView: UIImageView.init(image: UIImage(named: "avatar")))
        let vc = MSAlertController(title: "MESSAGE", message: "Hey!! Let's meet at Market-Square.",sideView: UIImageView.init(image: UIImage(named: "avatar")))

        
        let viewAction = MSAlertAction(title: "View") {
            self.dismiss(animated: true, completion: nil)
        }
        
        let settingAction = MSAlertAction(title: "Settings") {
            self.dismiss(animated: true, completion: nil)
        }
        
        let cancelAction = MSAlertAction(title: "Cancel") {
            self.dismiss(animated: true, completion: nil)
        }
        
        vc.addAction(action: viewAction)
        vc.addAction(action: settingAction)
        vc.addAction(action: cancelAction)
        self.present(vc, animated: false, completion: nil)
    }
    
}

