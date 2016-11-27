//
//  FirstDateViewController.swift
//  FiestaDeLaMediaNaranja
//
//  Created by Carlos  on 26/11/16.
//  Copyright © 2016 Carlos . All rights reserved.
//

import UIKit

class FirstDateViewController: UIViewController {

    var birthday: Date!
    @IBOutlet weak var firstDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Show info VC" || segue.identifier == "Show info Gesture" {
            if let ivc = segue.destination as? InfoViewController {
                let difference = firstDatePicker.date.timeIntervalSince(birthday)
                ivc.halfOrangeParty = Date(timeInterval: difference, since: firstDatePicker.date)
            }
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if(firstDatePicker.date >= Date()) {
            let alert = UIAlertController(title: "Error",
                                          message: "La fecha de la cita debe ser anterior a la actual",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancelar",
                                          style: .cancel,
                                          handler: {(aa: UIAlertAction) in print("No hacemos nada")}))
            present(alert, animated: true)
            return false
        } else if(firstDatePicker.date <= birthday) {
            let alert = UIAlertController(title: "Error",
                                          message: "La fecha de nacimiento debe ser anterior a la de la cita",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancelar",
                                          style: .cancel,
                                          handler: {(aa: UIAlertAction) in print("No hacemos nada")}))
            present(alert, animated: true)
            return false
        }
        return true
    }
}
