//
//  WorkoutView.swift
//  twerkout
//
//  Created by Zach Mell on 1/26/22.
//

import SwiftUI

struct WorkoutSelectorView: View {
    var workout: Workout
    var body: some View {
        VStack {
            Text(workout.name)
            ForEach(workout.excersizes)  {excersize in ExcersizeRow(exersize: excersize)
            }
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        let testExcersizes = [
            Excersize(id: 1, durationSeconds: 30, name: "Demo Excersize 1"),
            Excersize(id: 2, durationSeconds: 45, name: "Demo Excersize 2"),
        ]
        let testWorkout = Workout(name: "Demo Workout", excersizes: testExcersizes)
        WorkoutSelectorView(workout: testWorkout)
    }
}
