//
//  CoreDataManager.swift
//  BookWorm
//
//  Created by Elman Asadi on 9/12/21.
//

import Foundation
import CoreData
import SwiftUI

class CoreDataManager {
    
    static let shared = CoreDataManager(moc: NSManagedObjectContext.current)
    
    var moc : NSManagedObjectContext
    
    init(moc : NSManagedObjectContext) {
        self.moc = moc
    }
    
    // ========= Add Book =========
    
    func addBook(title : String, genre : String, author: String, review: String, rating: Int, id : UUID) {
        let book = Book(context: self.moc)
        
        book.title = title
        book.id = id
        book.author = author
        book.genre = genre
        book.review = review
        book.rating = Int16(rating)
        
        do {
            try self.moc.save()
        } catch {
            print(error)
        }
    }
    
    // ========= Fetch All Books =========
    
    func fetchAllBooks() -> [Book] {
        var books = [Book]()
        
        let bookRequest : NSFetchRequest<Book> = Book.fetchRequest()
        
        do {
            books = try self.moc.fetch(bookRequest)
        } catch {
            print(error)
        }
        return books
    }
    
    
}
