//
//  BookViewModel.swift
//  BookWorm
//
//  Created by Elman Asadi on 9/13/21.
//

import Foundation


class BookViewModel {
    var title : String = ""
    var genre : String = ""
    var author : String = ""
    var review : String = ""
    var id : UUID?
    var rating : Int = 0
    
    init(book : Book) {
        self.title = book.title ?? ""
        self.genre = book.genre ?? ""
        self.author = book.author ?? ""
        self.review = book.review ?? ""
        self.id = book.id
        self.rating = Int(book.rating)
    }
}
