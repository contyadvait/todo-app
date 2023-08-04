//
//  ContentView.swift
//  To Do
//
//  Created by Milind Contractor on 29/7/23.
//

import SwiftUI

struct ContentView: View {
    @State var todos = [Task(item: "Buy new MacBook Pro", priority: .low),
                        Task(item: "Sell kidney", priority: .medium),
                        Task(item: "Go for Swift accelerator program", description: "At Apple innovis 3rd floor, near one-north MRT station", priority: .urgent),
                        Task(item: "Join SAP EXCO", description: "Sign up at tk.sg/swiftexco2023", done: true, priority: .urgent)]
    @State var openCreator = false
    var body: some View {
        NavigationStack {
            List {
                ForEach($todos) { $todo in
                    NavigationLink {
                        ToDoDetailView(todo: $todo)
                    } label: {
                        HStack {
                            Image(systemName: todo.done ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(todo.done ? .green : .red)
                                .onTapGesture {
                                    todo.done.toggle()
                                }
                            VStack {
                                HStack {
                                    Text(todo.item)
                                        .multilineTextAlignment(.leading)
                                        .strikethrough(todo.done)
                                    Spacer()
                                }
                                if todo.description != "" {
                                    HStack {
                                        Text(todo.description)
                                            .font(.footnote)
                                            .foregroundColor(.gray)
                                            .strikethrough(todo.done)
                                            .multilineTextAlignment(.leading)
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }
                    .swipeActions(allowsFullSwipe: false) {
                        if todo.done {
                            Button {
                                todo.done.toggle()
                            } label: {
                                Label("Uncheck", systemImage: "checkmark.circle.badge.xmark.fill")
                            }
                            .tint(.red)
                        } else {
                            Button {
                                todo.done.toggle()
                            } label: {
                                Label("Done", systemImage: "checkmark.circle.fill")
                            }
                            .tint(.green)
                        }
                    }
                }
                
            }
            .navigationTitle(Text("Todos"))
            NavigationLink {
                TodoCreatorView(todos: $todos)
            } label: {
                Label("Create new todo", systemImage: "plus")
                    .padding()
            }
        }
        .navigationTitle(Text("Todos"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
