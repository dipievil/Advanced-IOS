//
//  ContentView.swift
//  AppTarefas
//
//  Created by IOS SENAC on 09/10/21.
//

import SwiftUI

struct TaskListView: View {
    
    @ObservedObject var taskListViewModel = TaskListViewModel()
    
    @State var presentAddNewItem = false
    
    @State var buttonText = "Adicionar nova tarefa"
    @State var buttonIcon = "plus.circle.fill"
    
    var tasks: [Task] = testDataTasks
    
    var body: some View {
        
        NavigationView{
            VStack{
                List{
                    ForEach(self.taskListViewModel.taskCellViewModels){ taskCell in
                        TaskCell(taskCellViewModel: taskCell)
                    }
                    .onDelete{ indexSet in
                        self.taskListViewModel.removeTasks(atOffsets: indexSet)
                    }
                    
                    if presentAddNewItem{
                        TaskCell(taskCellViewModel: TaskCellViewModel.newTask()){ result in
                            if case .success( let newTask ) = result {
                                self.taskListViewModel.addTask(newListTask: newTask)
                            }
                            self.presentAddNewItem.toggle()
                            self.buttonText = "Adicionar nova tarefa"
                        }
                    }
                    
                }
                Button(action: {
                    self.presentAddNewItem.toggle()
                self.buttonText = (self.presentAddNewItem == false ? "Adicionar nova tarefa" : "Cancelar")
                }){
                    HStack{
                        Image(systemName: self.buttonIcon).resizable().frame(width: 20, height: 20)
                        Text(self.buttonText)
                    }
                }
                .padding()
            }
            .navigationTitle("Tarefas")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}

struct  TaskCell: View{
    
    @ObservedObject var taskCellViewModel: TaskCellViewModel
    
    var onCommit: (Result<Task,InputError>) -> Void = {_ in}
    
    var body: some View{
        HStack{
            Image(systemName: taskCellViewModel.completionStateIconName).resizable().frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            TextField("Digite aqui sua tarefa", text: $taskCellViewModel.cellTask.title, onCommit: {
                    if self.taskCellViewModel.cellTask.title.isEmpty{
                        self.onCommit(.failure(.empty))
                    } else {
                        self.onCommit(
                            .success(self.taskCellViewModel.cellTask))
                    }
                    
                }
            ).id(taskCellViewModel.id)
        }
    }
}


enum InputError: Error{
    case empty
}
