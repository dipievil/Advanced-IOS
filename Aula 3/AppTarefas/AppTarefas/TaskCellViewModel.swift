//
//  TaskCellViewModel.swift
//  AppTarefas
//
//  Created by IOS SENAC on 09/10/21.
//

import Foundation
import Combine

class TaskCellViewModel: ObservableObject, Identifiable{
    
    @Published var cellTask: Task
    
    var id: String = ""
    
    @Published var completionStateIconName = ""
    
    var cancellables = Set<AnyCancellable>()
        
    static func newTask() -> TaskCellViewModel{
        TaskCellViewModel(cellTask: Task(title: "", priority: TaskPriority.medium, completed: false))
    }
    
    init(cellTask: Task) {
        self.cellTask = cellTask
        
        $cellTask
            .map{ $0.completed ? "checkmark.circle.fill" : "circle"}
            .assign(to: \.completionStateIconName, on: self)
            .store(in: &cancellables)
        
        $cellTask
            .map{ $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
        
    }
    
    
}
