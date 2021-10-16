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

    @StateObject var viewModel = ContentViewModel()
    
    ///@State var txtTemperatura = ""
    
    var body: some View {
        VStack{
            Text("Previsão do tempo").padding()
            Text(self.viewModel.temperature).padding()
            
            Button(action: {
                self.viewModel.getJsonForecast()
                
                ///txtTemperatura = viewModel.temperature
                print("clicou!")
            }){
                Text("Buscar")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class ContentViewModel: ObservableObject{
    
    @Published var temperature: String
    
    init(){
        self.temperature = "-"
    }

    func getJsonForecast(){
        
        let apiKey = "f9598d041799d05c0ad43bfd44ca305c"
        let cidade = "Canoas"
        let url = "http://api.openweathermap.org/data/2.5/weather?q=\(cidade)&appid=\(apiKey)&units=metric&lang=pt_br"
        
        AF.request(url, method: .get, encoding: JSONEncoding.default).responseData { (response) in
           print(response)
                       
            if let receivedData = response.data{
                    
                do{
                    if let JSONObj = try JSONSerialization.jsonObject(with: receivedData, options: []) as? [String: Any]{
                        
                        if let mainData = JSONObj["main"] as? [String: Any]{
                            if let val = mainData["temp"]{
                                let getTemperature = "\(val) Cº"
                                print("Get " + getTemperature)
                                self.temperature = getTemperature
                            }
                        }
                    }
                    
                } catch {
                    print("Erro ao tratar dados")
                }
            }
            print("self: " +  self.temperature )
        }
    }
}
