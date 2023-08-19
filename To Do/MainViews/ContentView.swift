//
//  ContentView.swift
//  To Do
//
//  Created by Milind Contractor on 29/7/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var todoManager = TodoManager()
    var body: some View {
        TabView {
            MainTodoView(todoManager: todoManager)
                .tabItem {
                    Label("Todos", systemImage: "checklist.checked")
                }
            HowManyMoreTodosView(todoManager: todoManager)
                .tabItem {
                    Label("Todos Remaining", systemImage: "xmark.circle")
                }
                .badge(todoManager.Todos.filter { $0.status == TaskStatus.incomplete }.count)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
