//
//  NacimientoViewController.swift
//  FiestaDeLaMediaNaranja
//
//  Created by Carlos  on 26/11/16.
//  Copyright © 2016 Carlos . All rights reserved.
//

import UIKit

class NacimientoViewController: UIViewController {

    @IBOutlet weak var birthdayPicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        if let birthDate = defaults.object(forKey: "birthday") as? Date {
            birthdayPicker.setDate(birthDate, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "First date VC" || segue.identifier == "First Date Gesture" {
            if let fdvc = segue.destination as? FirstDateViewController {
                fdvc.birthday = birthdayPicker.date
            }
            let defaults = UserDefaults.standard
            defaults.set(birthdayPicker.date, forKey: "birthday")
            defaults.synchronize()
        }
    }
    
    @IBAction func BackToBirthDay(_ segue: UIStoryboardSegue) {
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if(birthdayPicker.date >= Date()) {
            let alert = UIAlertController(title: "Error",
                                          message: "La fecha de nacimiento debe ser anterior a la actual",
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
