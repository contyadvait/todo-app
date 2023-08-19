import Foundation
import SwiftUI

enum Priority: Codable {
    case low, medium, high, urgent
}

enum TaskStatus: Codable {
    case incomplete, doing, done
}

struct Task: Identifiable, Codable {
    let id = UUID()
    
    var item: String
    var description: String = ""
    var status: TaskStatus = .incomplete
    var priority: Priority = .medium
    var dueDate: Date
    var displayedPriority: String {
        if priority == .low {
            return "!"
        } else if priority == .medium {
            return "!!"
        } else if priority == .high {
            return "!!!"
        } else if priority == .urgent {
            return "!!!!"
        }
        return "\(item)"
    }
    
    var color: Color = .blue
}

