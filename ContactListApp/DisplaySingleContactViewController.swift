//
//  DisplaySingleContactViewController.swift
//  ContactListApp
//
//  Created by Midhet Sulemani on 30/04/17.
//  Copyright © 2017 Midhet Sulemani. All rights reserved.
//

import UIKit

class DisplaySingleContactViewController: UIViewController {
    
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var contactNumber: UILabel!
    @IBOutlet weak var email: UILabel!
    
    var selectedContact = Contact()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstName.text = selectedContact.firstName
        lastName.text = selectedContact.lastName
        contactNumber.text = "\(selectedContact.contactNumber)"
        email.text = selectedContact.emailId
        
        title = "\(selectedContact.firstName) \(selectedContact.lastName)'s Contact Details"
    }
}
