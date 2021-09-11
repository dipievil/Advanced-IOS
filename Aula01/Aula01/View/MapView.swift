//
//  MapView.swift
//  Aula01
//
//  Created by IOS SENAC on 11/09/21.
//

import SwiftUI
import MapKit

struct MapView: View {

    var coordinate: CLLocationCoordinate2D

    @State var region = MKCoordinateRegion()
    
    var body: some View {
        Map(coordinateRegion: $region).onAppear{
            SetRegion(coordinate)
        }
    }
    
    private func SetRegion(_ regionCoordinate: CLLocationCoordinate2D){
        region = MKCoordinateRegion(
            center: regionCoordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: -30.11648984362135, longitude: -51.219977093854105))
    }
}
