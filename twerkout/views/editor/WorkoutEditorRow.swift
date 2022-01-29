//
//  WorkoutEditorRow.swift
//  twerkout
//
//  Created by Zach Mell on 1/27/22.
//

import SwiftUI

struct WorkoutEditorRow: View {
    
    @Binding var workout: Workout
    
    var body: some View {
        Text(workout.name)
    }
}

struct WorkoutEditorRow_Previews: PreviewProvider {
    static var previews: some View {
        let demoExcersizesOne = [Excersize(id: 1, name: "Push", sets: 3), Excersize(id: 2, name: "Pull", sets:2), Excersize(id: 3, name: "Spin", sets:1)]
        let demoWorkout = Workout(id: 1, name: "Easy One", excersizes: demoExcersizesOne)
        WorkoutEditorRow(workout: .constant(demoWorkout))
    }
}
