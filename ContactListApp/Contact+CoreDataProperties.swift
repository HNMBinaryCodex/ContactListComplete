//
//  Contact+CoreDataProperties.swift
//  ContactListApp
//
//  Created by Midhet Sulemani on 13/04/17.
//  Copyright © 2017 Midhet Sulemani. All rights reserved.
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var emailId: String?
    @NSManaged public var contactNumber: Int64

}
