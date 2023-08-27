//
//  Singer+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Prakhar Trivedi on 27/8/23.
//
//

import Foundation
import CoreData


extension Singer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    
    public var wrappedFirstName: String {
        firstName ?? "Unknown First Name"
    }
    
    public var wrappedLastName: String {
        lastName ?? "Unknown Last Name"
    }

}

extension Singer : Identifiable {

}
