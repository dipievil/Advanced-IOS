//
//  ContentView.swift
//  AppOndeEstou
//
//  Created by IOS SENAC on 11/09/21.
//

import SwiftUI
import MapKit

struct ContentView: View {
 
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: true)
            .ignoresSafeArea()
            .onAppear{
            viewModel.checkIfLocationServicesIsEnabled()
        }
        
    }
}

final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{

    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -30.1167186, longitude: -51.2203107), span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
    )

    var locationManager: CLLocationManager?
    
    func checkIfLocationServicesIsEnabled(){
        if CLLocationManager.locationServicesEnabled(){
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        } else {
            
        }
    }
    
    func checkLocationServicesAuthorization(){
        guard let locationManagerLocal = locationManager else {
            return
        }
        
        switch locationManager?.authorizationStatus {
        case .notDetermined:
            locationManagerLocal.requestWhenInUseAuthorization()
        case .restricted:
            print("Restrição: \(locationManagerLocal.authorizationStatus)")
        case .denied:
            print("Verifique as permissões de localização")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManagerLocal.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
        default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationServicesAuthorization()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
