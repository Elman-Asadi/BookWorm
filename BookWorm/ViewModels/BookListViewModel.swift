//
//  BookListViewModel.swift
//  BookWorm
//
//  Created by Elman Asadi on 9/13/21.
//

import Foundation
import SwiftUI
import CoreData

class BookListViewModel : ObservableObject {
    
    
    @Published var books = [BookViewModel]()
    
    init() {
        fetchAllBooks()
    }
    
    func fetchAllBooks() {
        self.books = CoreDataManager.shared.fetchAllBooks().map(BookViewModel.init)
        print(books)
    }
    
}

