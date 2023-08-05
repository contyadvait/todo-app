import Foundation
import SwiftUI

enum Priority {
    case low, medium, high, urgent
}

struct Task: Identifiable {
    let id = UUID()
    
    var item: String
    var description: String = ""
    var done: Bool = false
    var priority: Priority = .medium
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
