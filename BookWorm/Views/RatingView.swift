//
//  RatingView.swift
//  BookWorm
//
//  Created by Elman Asadi on 9/14/21.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var rating : Int
    
    var label : String = ""
    var maximumRating : Int = 5
    
    var offImage : Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor : Color = Color.gray
    var onColor : Color = Color.yellow
    
    var body: some View {
        
        HStack(spacing: 5) {
            if label.isEmpty == false {
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1) { number in
                self.image(for: number)
                    .foregroundColor(number > self.rating ? self.offColor : self.onColor)
                    .onTapGesture {
                        self.rating = number
                    }
            }
        }
        
    }
    
    
    func image(for number : Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
    
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(4))
    }
}
