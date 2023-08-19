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
    @State var color: Color = .blue
    @State var goingToCancel = false
    @State var dueDate = Date()
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
                
                ColorPicker(selection: $color) {
                    Label("Color", systemImage: "paintpalette.fill")
                }
                
                DatePicker(selection: $dueDate) {
                    HStack {
                        Image(systemName: "calendar")
                        Text("Deadline")
                            .dynamicTypeSize(.xSmall)
                    }
                
                }
                
                Button {
                    todos.append(Task(item: task, description: description, priority: priority, dueDate: dueDate, color: color))
                    dismiss()
                } label: {
                    Label("Create new task!", systemImage: "plus")
                }
                Button {
                    goingToCancel = true
                } label: {
                    Label("Cancel", systemImage: "minus")
                }
            }
        }
        .alert("Are you sure you want to cancel?", isPresented: $goingToCancel) {
            Button("Yes", role: .destructive) { dismiss() }
            Button("No", role: .cancel) {}
        }
    }
}
