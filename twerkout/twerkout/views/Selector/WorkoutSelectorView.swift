//
//  WorkoutView.swift
//  twerkout
//
//  Created by Zach Mell on 1/26/22.
//

import SwiftUI

struct WorkoutSelectorView: View {
    var workouts: [Workout]
    var body: some View {
        NavigationView {
            List {
                ForEach(workouts) { workout in
                    NavigationLink {
                        WorkoutView(workout: workout, isRestTime: false, index: 0)
                    } label: {
                        ExcersizeRow(workout: workout)
                    }
                    
                }
            }
            .navigationTitle("Workouts")
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        let testExcersizes = [
            Excersize(id: 1, durationSeconds: 30, name: "Demo Excersize 1"),
            Excersize(id: 2, durationSeconds: 45, name: "Demo Excersize 2"),
        ]
        let testWorkouts = [Workout(id: 1, name: "Demo Workout", excersizes: testExcersizes), Workout(id: 2, name: "Demo Workout 2", excersizes: testExcersizes), ]
        WorkoutSelectorView(workouts: testWorkouts)
    }
}
