//
//  PostEventViewController.swift
//  hop&bop
//
//  Created by Amy Sywe on 8/8/19.
//  Copyright © 2019 Haley Kim. All rights reserved.
//

import UIKit

class PostEventViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitPressed(_ sender: Any) {
        // TODO: Check if all fields are not nil
        var errorMsg = "The following fields are missing: "
        var validEvent = true
        
        if nameTextField.text == "" {
            errorMsg += "name, "
            validEvent = false;
        }
        if addressTextField.text == "" {
            errorMsg += "address, "
            validEvent = false
        }
        
        if validEvent {
            // TODO: Maybe check if event already exists?
            
            DatabaseHandler.addNewEvent(eventName: nameTextField.text!, locationName: "Location", address: addressTextField.text!, startTime: Date(), endTime: Date())
            
            let alert = UIAlertController(title: "Success!", message: "Event submitted!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        else {
            // Display error alert
            let alert = UIAlertController(title: "Missing Fields", message: String(errorMsg.prefix(errorMsg.count - 2)), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
