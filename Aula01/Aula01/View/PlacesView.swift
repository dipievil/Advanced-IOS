//
//  PlacesView.swift
//  Aula01
//
//  Created by IOS SENAC on 11/09/21.
//

import SwiftUI

struct PlacesView: View{
    var body: some View{
        NavigationView{
            List(places, id: \.id){ place in
                NavigationLink(destination: PlaceDetailsView(detailedPlace: place)){
                PlacesRowView(place: place)
                }
            }.navigationBarTitle("Meus locais", displayMode: .large)
        }
    }
}

struct PlacesView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesView()
    }
}
