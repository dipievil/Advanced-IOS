//
//  ContentViewModel.swift
//  CovidNumbers
//
//  Created by IOS SENAC on 16/10/21.
//

import Foundation
import SwiftyJSON


class ContentViewModel: ObservableObject{
    
    @Published var covidDataModel: CovidDataModel
    
    init(){
        self.covidDataModel = CovidDataModel()
    }
    
    func BuscaDados(){
        
        if let url = URL(string: "https://corona-virus-stats.herokuapp.com/api/v1/cases/general-stats"){
            
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                		
                if error == nil{
                        
                    if let receivedData = data{
                        
                        print(receivedData)
                        
                        do{
                            if let JSONObj = try JSONSerialization.jsonObject(with: receivedData, options: []) as? [String: Any]{
                                
                                if let mainData = JSONObj["data"] as? [String: Any]{
                                   
                                    if let val = mainData["recovery_cases"] as? String{
                                        self.covidDataModel.recoveryCases = val
                                    }
                                    
                                    if let val = mainData["total_cases"] as? String{
                                        self.covidDataModel.totalCases = val
                                    }
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

