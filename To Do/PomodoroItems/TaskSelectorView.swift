//
//  TaskSelectorView.swift
//  To Do
//
//  Created by Milind Contractor on 6/8/23.
//

import SwiftUI

struct TaskSelectorView: View {
    @Binding var todos: [Task]
    @Binding var taskSelected: Int
    @Environment(\.dismiss) var dismiss
    @Binding var cancelled: Bool
    var body: some View {
        Form {
            Section("Select a task you want to finish") {
                Picker("Select a Task", selection: $taskSelected) {
                    ForEach(0..<todos.count) { index in
                        if todos[index].status != .done {
                            Text(todos[index].item)
                        }
                    }
                }
                .pickerStyle(.wheel)
            }
            
            Section("Start") {
                Button {
                    todos[taskSelected].status = .doing
                    dismiss()
                } label: {
                    HStack(spacing: 5) {
                        Image(systemName: "timer")
                        Text("Start timer!")
                    }
                }
                
                Button {
                    cancelled = true
                    dismiss()
                } label: {
                    HStack(spacing: 5) {
                        Image(systemName: "xmark")
                        Text("Cancel")
                    }
                }
            }
        }
    }
}

//struct TaskSelectorView_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskSelectorView()
//    }
//}
