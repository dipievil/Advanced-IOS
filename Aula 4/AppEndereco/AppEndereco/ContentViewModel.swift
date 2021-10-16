//
//  ContentViewModel.swift
//  AppEndereco
//
//  Created by IOS SENAC on 16/10/21.
//

import Foundation

class ContentViewModel: ObservableObject{
    
    @Published var address: Address
    
    init(){
        self.address = Address()
    }
    
    func BuscaCep( cep: String ){
        
        if let url = URL(string: "https://viacep.com.br/ws/" + cep + "/json/"){
            
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                if error == nil{
                    
                    if let receivedData = data{
                        
                        do{
                            if let JSONObj = try JSONSerialization.jsonObject(with: receivedData, options: []) as? [String: Any]{
                                
                                if let logradouro = JSONObj["logradouro"] as? String{
                                    self.address.street = logradouro
                                }
                                                                
                                if let localidade = JSONObj["localidade"] as? String{
                                    self.address.location = localidade
                                }
                            }
                            
                        } catch {
                            print("Erro ao tratar dados")
                        }
                    }
                } else{
                    print (error!)
                }
            }
            
            task.resume()
        }
    }
}
/*
struct ContentViewModel: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ContentViewModel_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewModel()
    }
}
*/
