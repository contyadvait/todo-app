//
//  ToDoDetailView.swift
//  To Do
//
//  Created by Milind Contractor on 29/7/23.
//

import SwiftUI

struct ToDoDetailView: View {
    @Binding var todo: Task
    @Binding var todos: [Task]
    var body: some View {
        List {
            TextField("Edit Item", text: $todo.item)
            
            TextField("Edit description", text: $todo.description)
                .textFieldStyle(.plain)
                .lineLimit(10, reservesSpace: true)
            
            HStack {
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
                
                Divider()
                
                
                Picker("Task Status", selection: $todo.status) {
                    Text("Todo")
                        .tag(TaskStatus.incomplete)
                    Text("Doing")
                        .tag(TaskStatus.doing)
                    Text("Done")
                        .tag(TaskStatus.done)
                }
                .pickerStyle(.menu)
            }
            
            DatePicker(selection: $todo.dueDate) {
                Label("Due Date", systemImage: "calendar")
            }
            
            ColorPicker(selection: $todo.color) {
                Label("Color", systemImage: "paintpalette.fill")
            }
        }
    }
}

