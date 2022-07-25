//
//  pomodoro_nanoApp.swift
//  pomodoro_nano
//
//  Created by Gerald Bryan on 25/07/22.
//

import SwiftUI

@main
struct pomodoro_nanoApp: App {
//    let persistenceController = PersistenceController.shared
    
    @StateObject var pomodoroModel: PomodoroModel = .init()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(pomodoroModel)
        }
    }
}
