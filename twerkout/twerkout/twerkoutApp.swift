//
//  twerkoutApp.swift
//  twerkout
//
//  Created by Zach Mell on 1/26/22.
//

import SwiftUI

@main
struct twerkoutApp: App {
    let demoWorkouts = [Workout(id: 1, name: "Easy One", excersizes: [Excersize(id: 1, name: "Push"), Excersize(id: 2, name: "Pull"), Excersize(id: 3, name: "Spin")]), Workout(id: 2, name: "Hard One", excersizes: [Excersize(id: 1, name: "Push"), Excersize(id: 2, name: "Pull"), Excersize(id: 3, name: "Spin")])]
    var body: some Scene {
        WindowGroup {
            ContentView(workouts: demoWorkouts)
        }
    }
}
