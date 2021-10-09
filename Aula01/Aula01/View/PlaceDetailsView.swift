//
//  PlaceDetailsView.swift
//  Aula01
//
//  Created by IOS SENAC on 11/09/21.
//

import SwiftUI
import MapKit

struct PlaceDetailsView: View {

    var detailedPlace: Place
    
    var body: some View {
        
        ScrollView{
            MapView(coordinate: detailedPlace.locationCoordinate)
                .frame(height:300)
                .ignoresSafeArea()
                
            CircleImageView(image: detailedPlace.image)
                .offset(y: -120)
                .padding(.bottom, -130)
            
            VStack{
                Text(detailedPlace.name).font(.title).padding(5).foregroundColor(.primary)
                
                HStack{
                    Text(detailedPlace.park)
                    Spacer()
                    Text(detailedPlace.city)
                }.font(.subheadline).foregroundColor(.secondary)
                HStack{
                    Text(detailedPlace.category)
                    Spacer()
                    Text(detailedPlace.state)
                }.font(.subheadline).foregroundColor(.secondary)
                
                Divider()
                Text(detailedPlace.description).font(.title2).padding(5)
                
            }.padding(10)
        }.navigationBarTitle(detailedPlace.name, displayMode: .inline)
        
    }
}



struct PlaceDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetailsView(detailedPlace: places[0])
    }
}
