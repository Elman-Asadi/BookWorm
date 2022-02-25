//
//  AddBookView.swift
//  BookWorm
//
//  Created by Elman Asadi on 9/12/21.
//

import SwiftUI

struct AddBookView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    let genres = ["Fantacy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    @State private var addBookViewModel = AddBookViewModel()
//    @State private var rating = 4
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name Of Book", text: self.$addBookViewModel.title)
                    TextField("Author's Name", text: self.$addBookViewModel.author)
                    
                    Picker("Genre", selection: self.$addBookViewModel.genre) {
                        ForEach(genres, id: \.self) { genre in
                            Text(genre)
                        }
                    }
                }
                
                Section {
                    
                    RatingView(rating: self.$addBookViewModel.rating)
                    
                    TextField("Write a review", text: self.$addBookViewModel.review)
                    
                }
                
                Section() {
                    Button("Save") {
                        addBookViewModel.saveBook()
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
                
            }
            .navigationTitle("Add Book")
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
