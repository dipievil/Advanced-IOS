//
//  PlacesView.swift
//  Aula01
//
//  Created by IOS SENAC on 11/09/21.
//

import SwiftUI

struct PlacesRowView: View{
    
    var place : Place
    
    var body: some View{
        
        HStack{
            place.image.resizable().frame(width: 50, height: 50)
            Text(place.name)
            Spacer()
        }
        
    }
}

struct PlacesRowView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesRowView(place: places[1])
    }
}
