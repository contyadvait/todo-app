//
//  PomodoroView.swift
//  To Do
//
//  Created by Milind Contractor on 6/8/23.
//

import SwiftUI
import Foundation

enum PomodoroStatus {
    case shortBreak, longBreak, workTime
}

struct PomodoroView: View {
    @State private var remainingTime: TimeInterval = 60 * 25
    @State private var timer: Timer?
    @State private var status: PomodoroStatus = .workTime
    @State var taskSelector: Bool = true
    @State var taskSelected: Int = 0
    @State var timerRunning: Bool = false
    @Binding var todos: [Task]
    @Environment(\.dismiss) var dismiss
    @State var canceled = false
    @State var shortBreaks: Int = 0
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                Text(timeString(from: remainingTime))
                    .font(.system(size: 120, weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
                    .padding()
                
                Button {
                    dismiss()
                } label: {
                    Label("Close", systemImage: "xmark")
                }
                .buttonStyle(.bordered)
                
                if (timeString(from: remainingTime) == "05:00" || timeString(from: remainingTime) == "30:00") && !timerRunning{
                    Button {
                        startTimer()
                    } label: {
                        HStack {
                            Image(systemName: "\(shortBreaks).circle")
                            Text("Start Break")
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                } else if timeString(from: remainingTime) == "25:00" && !timerRunning {
                    Button {
                        taskSelector = true
                    } label: {
                        HStack {
                            Image(systemName: "checklist")
                            Text("Select your next task")
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                }
            }
        }
        .ignoresSafeArea()
        .onDisappear {
            timer?.invalidate()
            timer = nil
        }
        .fullScreenCover(isPresented: $taskSelector) {
            TaskSelectorView(todos: $todos, taskSelected: $taskSelected, cancelled: $canceled)
        }
        .onChange(of: canceled) { cancellation in
            print("Cancellation launched, closing pomodoro timer")
            dismiss()
        }
        .onChange(of: taskSelector) { taskSelectorLaunched in
            if taskSelectorLaunched == false {
                startTimer()
            }
        }
}

func startTimer() {
    timerRunning = true
    timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
        if remainingTime > 0 {
            remainingTime -= 1
        } else {
            todos[taskSelected].status = .done
            timer.invalidate()
            if status == .workTime {
                if shortBreaks != 4 {
                    shortBreaks = shortBreaks + 1
                    status = .shortBreak
                    remainingTime = 60 * 5
                } else {
                    shortBreaks = 0
                    status = .longBreak
                    remainingTime = 60 * 30
                }
            } else {
                status = .workTime
                remainingTime = 60 * 25
            }
            timerRunning = false
        }
    }
}

func timeString(from timeInterval: TimeInterval) -> String {
    let minutes = Int(timeInterval) / 60
    let seconds = Int(timeInterval) % 60
    return String(format: "%02d:%02d", minutes, seconds)
}
}

//struct PomodoroView_Previews: PreviewProvider {
//    static var previews: some View {
//        PomodoroView()
//    }
//}
