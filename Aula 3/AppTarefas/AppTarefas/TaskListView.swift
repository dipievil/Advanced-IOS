//
//  ContentView.swift
//  AppTarefas
//
//  Created by IOS SENAC on 09/10/21.
//

import SwiftUI

struct TaskListView: View {
    
    var tasks: [Task] = testDataTasks
    
    var body: some View {
        
        NavigationView{
            VStack{
                List{
                    ForEach(self.tasks){ task in
                        TaskCell(task: task)
                    }
                    .onDelete{ indexSet in
                        
                    }
                }
                Button(action: {}){
                    HStack{
                        Image(systemName: "plus.circle.fill").resizable().frame(width: 20, height: 20)
                        Text("Adicionar tarefa")
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
    var task: Task
    var body: some View{
        HStack{
            Image(systemName: task.completed ? "circle.fill" : "circle").resizable().frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text(task.title)
        }
    }
}
