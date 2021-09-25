//
//  ContentView.swift
//  RequestRemoteJson
//
//  Created by IOS SENAC on 25/09/21.
//

import SwiftUI
import Alamofire
import Foundation

struct ContentView: View {

    @State var txtTemperatura = ""
    
    var body: some View {
        VStack{
            Text("Previsão do tempo").padding()
            TextField("temperatura", text: $txtTemperatura).textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Buscar"){
                self.txtTemperatura = getJsonForecast()
                print("clicou!")
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func getJsonForecast() -> String{
    var temperature = ""
    let apiKey = "f9598d041799d05c0ad43bfd44ca305c"
    let cidade = "Canoas"
    let url = "http://api.openweathermap.org/data/2.5/weather?q=\(cidade)&appid=\(apiKey)&units=metric&lang=pt_br"
    
    AF.request(url, method: .get, encoding: JSONEncoding.default).responseJSON { response in
                
        print(response)
        
        let dataReturn = response.value as? [String : Any]
        let mainInfo = dataReturn?["main"] as? [String : Any]
        
        let temp = mainInfo!["temp"]
 
        print(temp as Any)
        temperature = temp
        
    }
    return temperature
        
}
