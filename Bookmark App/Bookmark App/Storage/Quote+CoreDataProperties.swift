//
//  Quote+CoreDataProperties.swift
//  Bookmark App
//
//  Created by James Dunn on 6/8/22.
//
//

import Foundation
import CoreData


extension Quote {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Quote> {
        return NSFetchRequest<Quote>(entityName: "Quote")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var pageNumber: Int16
    @NSManaged public var text: String?
    @NSManaged public var book: Book?

}

extension Quote : Identifiable {

}
