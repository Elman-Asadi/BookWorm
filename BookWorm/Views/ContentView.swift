//
//  ContentView.swift
//  BookWorm
//
//  Created by Elman Asadi on 9/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAddScreen = false
    @ObservedObject var bookListVM : BookListViewModel = BookListViewModel()
    
    var body: some View {
        
        NavigationView {
            //            Text("Count: \(self.bookListVM.books.count)")
            
            List {
                ForEach(bookListVM.books, id: \.id) { book in
                    Text(book.review)
                }
            }
            
            .navigationTitle("Bookworm")
            .navigationBarItems(trailing: Button(action: {
                self.showingAddScreen.toggle()
            }) {
                Image(systemName: "plus")
            }
            )
            .sheet(isPresented: $showingAddScreen, onDismiss: {
                bookListVM.fetchAllBooks()
            }) {
                AddBookView()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
