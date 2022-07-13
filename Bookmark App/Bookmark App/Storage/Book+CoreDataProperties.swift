//
//  Book+CoreDataProperties.swift
//  Bookmark App
//
//  Created by James Dunn on 6/8/22.
//
//

import Foundation
import CoreData


extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book")
    }

    @NSManaged public var author: String?
    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var quotes: NSSet?
    @NSManaged public var imageURL: String?
    @NSManaged public var library: Library?

}

// MARK: Generated accessors for quotes
extension Book {

    @objc(addQuotesObject:)
    @NSManaged public func addToQuotes(_ value: Quote)

    @objc(removeQuotesObject:)
    @NSManaged public func removeFromQuotes(_ value: Quote)

    @objc(addQuotes:)
    @NSManaged public func addToQuotes(_ values: NSSet)

    @objc(removeQuotes:)
    @NSManaged public func removeFromQuotes(_ values: NSSet)

}

extension Book : Identifiable {

}
