//
//  ViewController.swift
//  FiestaDeLaMediaNaranja
//
//  Created by Carlos  on 26/11/16.
//  Copyright © 2016 Carlos . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func methodName(_ segue: UIStoryboardSegue) {
    }
    
    @IBAction func showPopover(sender: UIButton) {
        if let pvc = storyboard?.instantiateViewController(withIdentifier: "POS") as? PopOverViewController {
            pvc.modalPresentationStyle = .popover
            pvc.popoverPresentationController?.sourceView = view
            pvc.popoverPresentationController?.sourceRect = sender.frame
            pvc.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.right
            
            present(pvc, animated: true)
        }
    }


}

