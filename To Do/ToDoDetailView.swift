//
//  ToDoDetailView.swift
//  To Do
//
//  Created by Milind Contractor on 29/7/23.
//

import SwiftUI

struct ToDoDetailView: View {
    @Binding var todo: Task
    var body: some View {
        List {
            TextField("Edit Item", text: $todo.item)
            
            TextField("Edit description", text: $todo.description)
            
            Picker("Priority", selection: $todo.priority) {
                Text("Low")
                    .tag(Priority.low)
                Text("Medium")
                    .tag(Priority.medium)
                Text("High")
                    .tag(Priority.high)
                Text("Urgent")
                    .tag(Priority.urgent)
            }
            .pickerStyle(.menu)
            
            Toggle("Is done?", isOn: $todo.done)
        }
    }
}
//
//struct ToDoDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ToDoDetailView(todo: .constant(Task(item: "Item")))
//    }
//}
