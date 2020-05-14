//
//  LoginUsers+CoreDataProperties.swift
//  NoteApp
//
//  Created by George Digmelashvili on 5/14/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//
//

import Foundation
import CoreData


extension LoginUsers {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LoginUsers> {
        return NSFetchRequest<LoginUsers>(entityName: "Users")
    }

    @NSManaged public var username: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var newRelationship: NSSet?
    @NSManaged public var books: Set<Notes>

}

// MARK: Generated accessors for newRelationship
extension LoginUsers {

    @objc(addNewRelationshipObject:)
    @NSManaged public func addToNewRelationship(_ value: Notes)

    @objc(removeNewRelationshipObject:)
    @NSManaged public func removeFromNewRelationship(_ value: Notes)

    @objc(addNewRelationship:)
    @NSManaged public func addToNewRelationship(_ values: NSSet)

    @objc(removeNewRelationship:)
    @NSManaged public func removeFromNewRelationship(_ values: NSSet)

}
