//
//  HowManyMoreTodosView.swift
//  To Do
//
//  Created by Milind Contractor on 8/8/23.
//

import SwiftUI

struct HowManyMoreTodosView: View {
    @StateObject var todoManager: TodoManager
    var body: some View {
        VStack {
            Text("Number of todos remaining todo")
            Text(String(todoManager.Todos.filter { $0.status == .incomplete }.count))
                .font(.system(size: 120, weight: .semibold, design: .monospaced))
            
            Text("Number of todos in progress")
            Text(String(todoManager.Todos.filter { $0.status == .doing}.count))
                .font(.system(size: 120, weight: .semibold, design: .monospaced))
        }
    }
}
