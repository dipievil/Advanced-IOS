//
//  TaskRepository.swift
//  AppTarefas
//
//  Created by IOS SENAC on 09/10/21.
//

import Foundation

class BaseTaskRepository{
    @Published var tasks = [Task]()
    
}

protocol TaskRepository: BaseTaskRepository{
    func addTask(_ newTask: Task)
    func removeTask(_ newTask: Task)
    func updateTask(_ newTask: Task)
}
