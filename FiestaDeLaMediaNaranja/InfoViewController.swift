//
//  InfoViewController.swift
//  FiestaDeLaMediaNaranja
//
//  Created by Carlos  on 26/11/16.
//  Copyright © 2016 Carlos . All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    var halfOrangeParty: Date!
    @IBOutlet weak var halfOrangePartyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        halfOrangePartyLabel.text = halfOrangeParty.description(with: Locale(identifier: "es_ES")).components(separatedBy: ",")[1]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
