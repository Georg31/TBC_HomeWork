//
//  LoginUsers+CoreDataProperties.swift
//  NoteApp
//
//  Created by George Digmelashvili on 5/15/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//
//

import Foundation
import CoreData


extension LoginUsers {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<LoginUsers> {
        return NSFetchRequest<LoginUsers>(entityName: "Users")
    }

    @NSManaged public var username: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var noteRelation: NSSet?

}

// MARK: Generated accessors for noteRelation
extension LoginUsers {

    @objc(addNoteRelationObject:)
    @NSManaged public func addToNoteRelation(_ value: Notes)

    @objc(removeNoteRelationObject:)
    @NSManaged public func removeFromNoteRelation(_ value: Notes)

    @objc(addNoteRelation:)
    @NSManaged public func addToNoteRelation(_ values: NSSet)

    @objc(removeNoteRelation:)
    @NSManaged public func removeFromNoteRelation(_ values: NSSet)

}
