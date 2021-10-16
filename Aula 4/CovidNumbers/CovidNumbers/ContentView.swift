//
//  ContentView.swift
//  CovidNumbers
//
//  Created by IOS SENAC on 16/10/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        VStack{
            
            Text("País com mais casos de COVID-19 no último dia").padding()
            
            Button(action: {
                self.viewModel.BuscaDados()
            }){
                Text("Consultar")
            }.padding()

            HStack{
                Text("Total de casos: ")
                Text(self.viewModel.covidDataModel.recoveryCases)
            }.padding(10)
            HStack{
                Text("Recuperados: ")
                Text(self.viewModel.covidDataModel.totalCases)
            }.padding(10)
        }       
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
