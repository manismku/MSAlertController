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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func showAlert(_ sender: Any) {
        //let vc = MSAlertViewController(title: "INSTAGRAM", message: "Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!! Happy Coding!!")
        
         //let vc = MSAlertViewController(title: "INSTAGRAM", message: "Happy Coding!! Happy Coding!! Happy Coding!!")
         let vc = MSAlertViewController(title: "INSTAGRAM", message: "Lets meet at Park Square!!")
        
        //vc.setAppearance { () -> Appearance in
        //}
        
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

