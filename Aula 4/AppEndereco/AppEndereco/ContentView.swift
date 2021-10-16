//
//  ContentView.swift
//  AppEndereco
//
//  Created by IOS SENAC on 16/10/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    @State var cep = String()
        
    var body: some View {
        
        VStack{
            TextField("Insira o CEP (apenas números):", text: $cep)
                
            Button(action: {
                self.viewModel.BuscaCep(cep: self.cep)
            }){
                Text("Consultar")
            }
            
            HStack{
                Text("Logradouro: ")
                Text(self.viewModel.address.street)
            }.padding()
            
            HStack{
                Text("Localidade: ")
                Text(self.viewModel.address.location
                )
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
