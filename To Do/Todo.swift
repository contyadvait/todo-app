import Foundation

enum Priority {
    case low, medium, high, urgent
}

struct Task: Identifiable {
    let id = UUID()
    
    var item: String
    var description: String = ""
    var done: Bool = false
    var priority: Priority = .medium
}
