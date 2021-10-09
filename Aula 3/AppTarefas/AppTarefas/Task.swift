//
//  Task.swift
//  AppTarefas
//
//  Created by IOS SENAC on 09/10/21.
//

import Foundation
import FirebaseFirestore

enum TaskPriority{
    case high
    case medium
    case low
}

struct Task: Identifiable{
    var id: String? // = UUID().uuidString
    var title: String
    var priority : TaskPriority
    var completed: Bool
    //@ServerTimestampBehavior var createdTime: ServerTimestampBehavior
}

let testDataTasks = [
    Task(title: "Criar o projeto", priority: .medium, completed: true),
    Task(title: "Conectar com Firebase", priority: .high, completed: false),
    Task(title: "Publicar o app", priority: .low, completed: false)
]
