//
//  ModelData.swift
//  Aula01
//
//  Created by IOS SENAC on 11/09/21.
//

import Foundation

var  places: [Place] = load("landmarkData.json")

func load<T: Decodable>(_ filename: String) -> T{
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("Filé não foi encontrado: \(filename)")
    }
    
    do{
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Erro ao ler \(filename). \nErro: \n \(error)")
    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch{
        fatalError("Não foi possível decodificar \(filename). \nErro: \n \(error)")
    }
}
