//
//  TaskListViewModel.swift
//  AppTarefas
//
//  Created by IOS SENAC on 09/10/21.
//

import Foundation

class TaskListViewModel: ObservableObject{
    
    @Published var taskCellViewModels: [TaskCellViewModel]
    
    // Adicionar depois
    
    init(){
        self.taskCellViewModels = testDataTasks.map{ testTask in
            TaskCellViewModel(cellTask: testTask)
        }
    }
    
    func addTask(newTask: Task){
        self.taskCellViewModels.append(TaskCellViewModel(cellTask: newTask))
    }
    
    func removeTasks(atOffsets indexSet: IndexSet){
        self.taskCellViewModels.remove(atOffsets: indexSet)
    }
}
