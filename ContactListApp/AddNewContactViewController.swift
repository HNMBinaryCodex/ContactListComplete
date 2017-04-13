//
//  AddNewContactViewController.swift
//  ContactListApp
//
//  Created by Midhet Sulemani on 13/04/17.
//  Copyright © 2017 Midhet Sulemani. All rights reserved.
//

import UIKit
import CoreData

class AddNewContactViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var contactTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var firstNameTF: UITextField!
    
    @IBAction func saveContact(_ sender: UIBarButtonItem) {
        
        let helper = CoreDataHelper()
        
        let newContact = NSEntityDescription.insertNewObject(forEntityName: "Contact", into: helper.context) as! Contact
        newContact.firstName = firstNameTF.text
        newContact.lastName = lastNameTF.text
        newContact.emailId = emailTF.text
        newContact.contactNumber = Int64(contactTF.text!)!
        
        do {
            try helper.context.save()
            print("saved contact")
        }
        catch
        {
            print("error in saving context")
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTF.delegate = self
        contactTF.delegate = self
        lastNameTF.delegate = self
        firstNameTF.delegate = self
    }

}

extension AddNewContactViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}
