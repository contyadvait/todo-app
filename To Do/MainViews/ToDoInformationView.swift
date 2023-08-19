//
//  ToDoInformationView.swift
//  To Do
//
//  Created by Milind Contractor on 5/8/23.
//

import SwiftUI

struct ToDoInformationView: View {
    @Binding var todo: Task
    @Binding var todos: [Task]
    var defaultItems: some View {
        VStack {
            HStack {
                
                Text(todo.displayedPriority)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.red)
                
                Text(todo.item)
                    .multilineTextAlignment(.leading)
                    .strikethrough(todo.status == .done)
                
                Spacer()
            }
            if todo.description != "" {
                HStack {
                    Text(todo.description)
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .strikethrough(todo.status == .done)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
            }
        }
    }
    
    var body: some View {
        HStack {
            if todo.status == .incomplete {
                Image(systemName: "circle")
                    .foregroundColor(todo.color)
                    .onTapGesture {
                        todo.status = .doing
                    }
                defaultItems
            } else if todo.status == .doing {
                Image(systemName: "pencil.circle")
                    .foregroundColor(todo.color)
                    .onTapGesture {
                        todo.status = .done
                    }
                defaultItems
            }
        }
    }
}

