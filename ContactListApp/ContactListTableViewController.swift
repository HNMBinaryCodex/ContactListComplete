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
    
    //Function to fetch all the contacts stored in the database
    
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
        
        //Cell configuration
        
        cell.name.text = "\(allContacts[indexPath.row].firstName!) \(allContacts[indexPath.row].lastName!)"
        cell.contactNumber.text = String(allContacts[indexPath.row].contactNumber)
        cell.emailAddress.text = allContacts[indexPath.row].emailId
        
        return cell
    }

}

//Custom Cell Class
class ContactTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var contactNumber: UILabel!
    @IBOutlet weak var emailAddress: UILabel!
    
}
