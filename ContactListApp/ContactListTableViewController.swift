//
//  ContactListTableViewController.swift
//  ContactListApp
//
//  Created by Midhet Sulemani on 13/04/17.
//  Copyright © 2017 Midhet Sulemani. All rights reserved.
//

import UIKit
import CoreData

class ContactListTableViewController: UITableViewController {

    var allContacts: [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        fetchAllContacts()
    }
    
    func fetchAllContacts() {
        
        let helper = CoreDataHelper()
        
        let fr = NSFetchRequest<NSFetchRequestResult>(entityName: "Contact")
        allContacts = try! helper.context.fetch(fr) as! [Contact]
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allContacts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ContactTableViewCell
        
        print("contact at index", indexPath.row, allContacts[indexPath.row].firstName!)
        
        if allContacts.count > 0 {
            
            cell.firstName.text = allContacts[indexPath.row].firstName!
            cell.lastName.text = allContacts[indexPath.row].lastName
            cell.contactNumber.text = String(allContacts[indexPath.row].contactNumber)
            cell.emailAddress.text = allContacts[indexPath.row].emailId
        }
        
        return cell
    }

}

class ContactTableViewCell: UITableViewCell {
    
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var contactNumber: UILabel!
    @IBOutlet weak var emailAddress: UILabel!
    
}
