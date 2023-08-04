//
//  TodoCreatorView.swift
//  To Do
//
//  Created by Milind Contractor on 30/7/23.
//

import SwiftUI

struct TodoCreatorView: View {
    @Binding var todos: [Task]
    @Environment(\.dismiss) var dismiss
    @State var task: String = ""
    @State var description: String = ""
    @State var priority: Priority = .medium
    var body: some View {
        List {
            Section("Create new task") {
                TextField("Do the laundry...", text: $task)
                TextField("Get the laundry dry-cleaned (preferably on your way to work)", text: $description)
                
                Picker("Priority", selection: $priority) {
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
                
                Button {
                    todos.append(Task(item: task, description: description, priority: priority))
                    dismiss()
                } label: {
                    Label("Create new task!", systemImage: "plus")
                }
            }
        }
    }
}
//
//struct TodoCreatorView_Previews: PreviewProvider {
//    static var previews: some View {
//        TodoCreatorView()
//    }
//}
