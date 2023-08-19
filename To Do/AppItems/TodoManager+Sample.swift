import Foundation

extension Task {
    static let sampleTodos = [
        Task(item: "Welcome to todoist!", description: "You can load this tutorial at anytime with the more button above", priority: .urgent, dueDate: Date(), color: .green),
        Task(item: "The exclaimation marks on the side show the priority of the task", description: "The more, the more urgent the task is", priority: .urgent, dueDate: Date(), color: .blue),
        Task(item: "You can edit tasks by clicking on the task on the arrow to open more details about it", description: "You can also change things such as the description, color, priority, etc.", priority: .medium, dueDate: Date(), color: .red),
        Task(item: "There is also a pomodoro timer for better productivity", description: "Click on the more button to access it", status: .doing, dueDate: Date(), color: .green),
        Task(item: "Tap on the circle/pencil/checkmark to change the status of a task", description: "Circle means the task is not done (yet), Pencil means you are doing the task, and checkmark means you have finished it", dueDate: Date()),
        Task(item: "Change the order of tasks from the 'Edit' menu above", description: "You can also swipe left to quickly delete tasks", priority: .low, dueDate: Date(), color: .red)
    ]
}
