//
//  BookViewModel.swift
//  BookWorm
//
//  Created by Elman Asadi on 9/12/21.
//

import Foundation
import CoreData

class AddBookViewModel {
    
    var title : String = ""
    var genre : String = ""
    var author : String = ""
    var review : String = ""
    var id : UUID = UUID()
    var rating : Int = 2
    
    func saveBook() {
        CoreDataManager.shared.addBook(title: title, genre: genre, author: author, review: review, rating: rating, id: id)
    }
    
}
