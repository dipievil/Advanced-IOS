//
//  FirestorTaskRepository.swift
//  AppTarefas
//
//  Created by IOS SENAC on 09/10/21.
//

import Foundation
import FirebaseFirestore

class FirestoreTaskRepository: BaseTaskRepository, TaskRepository, ObservableObject{
    
    var db = Firestore.firestore()
    
    override init(){
        
        super.init()
        
        db.collection("tasks").order(by: "title").addSnapshotListener { (querySnapshot, Error) in
            
            if let querySnapshot = querySnapshot{
                self.tasks = querySnapshot.documents.compactMap{ document -> Task? in
                    try? document.data(as: Task.self)
                    
                }
            }
            
        }
    }
    
    func addTask(_ newTask: Task){
        do{
            let _ = try db
                .collection("tasks")
                .addDocument(data: [
                                "title": newTask.title,
                                "completed" : newTask.completed]){ err in
                    if let err = err {
                        print("erro ao adicionar: \(err)")
                    } else {
                        print("adicionado")
                    }
                
            }
        } catch{
            print("Deu erro")
        }
    }
}
