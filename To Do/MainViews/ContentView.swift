//
//  ContentView.swift
//  To Do
//
//  Created by Milind Contractor on 29/7/23.
//

import SwiftUI

struct ContentView: View {
    @State var todos = [Task(item: "Buy new MacBook Pro", priority: .low, color: .green),
                        Task(item: "Sell kidney", priority: .medium, color: .blue),
                        Task(item: "Go for Swift accelerator program", description: "At Apple innovis 3rd floor, near one-north MRT station", priority: .urgent, color: .orange),
                        Task(item: "Join SAP EXCO", description: "Sign up at tk.sg/swiftexco2023", done: true, priority: .urgent, color: .gray)]
    @State var openCreator = false
    var body: some View {
        NavigationStack {
            List($todos, editActions: .all) { $todo in
                NavigationLink {
                    ToDoDetailView(todo: $todo)
                } label: {
                    ToDoInformationView(todo: $todo)
                }
            }
            .navigationTitle(Text("Todos"))
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        openCreator = true
                    } label: {
                        Label("Create new todo", systemImage: "plus")
                            .padding()
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $openCreator) {
            TodoCreatorView(todos: $todos)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
