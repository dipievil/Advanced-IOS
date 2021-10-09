//
//  TaskCellViewModel.swift
//  AppTarefas
//
//  Created by IOS SENAC on 09/10/21.
//

import Foundation

class TaskCellViewModel: ObservableObject{
    
    @Published var task: Task
    
    var id: String = ""
    
    // TODO
        
    static func newTask() -> TaskCellViewModel{
        TaskCellViewModel(cellTask: Task(title: "", priority: TaskPriority.medium, completed: false))
    }
    
    init(cellTask: Task) {
        self.task = cellTask
        
        // TODO
        
    }
    
    
}
