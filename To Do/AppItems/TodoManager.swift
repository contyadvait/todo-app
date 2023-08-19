import Foundation
import SwiftUI

class TodoManager: ObservableObject {
    @Published var Todos: [Task] = [] {
        didSet {
            save()
        }
    }
    
    @Published var searchTerm = ""
    @Published var organisedList = false
    
    var todosFiltered: Binding<[Task]> {
        Binding(
            get: {
                if self.searchTerm == "" { return self.Todos }
                return self.Todos.filter {
                    $0.item.lowercased().contains(self.searchTerm.lowercased())
                }
            },
            set: {
                self.Todos = $0
            }
        )
    }

    
    init() {
        load()
    }
    
    func getArchiveURL() -> URL {
        let plistName = "Todos.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func loadSampleData() {
        Todos = Task.sampleTodos
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedTodos = try? propertyListEncoder.encode(Todos)
        try? encodedTodos?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
                
        if let retrievedTodoData = try? Data(contentsOf: archiveURL),
            let TodosDecoded = try? propertyListDecoder.decode([Task].self, from: retrievedTodoData) {
            Todos = TodosDecoded
        }
    }
}
