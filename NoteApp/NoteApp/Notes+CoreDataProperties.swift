//
//  Notes+CoreDataProperties.swift
//  NoteApp
//
//  Created by George Digmelashvili on 5/15/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//
//

import Foundation
import CoreData


extension Notes {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<Notes> {
        return NSFetchRequest<Notes>(entityName: "Notes")
    }

    @NSManaged public var name: String?
    @NSManaged public var notebody: String?
    @NSManaged public var userRelation: LoginUsers?

}
