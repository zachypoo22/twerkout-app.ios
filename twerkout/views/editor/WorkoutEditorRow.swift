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
            .colorInvert().foregroundColor(Color.cyan)
    }
}

struct WorkoutEditorRow_Previews: PreviewProvider {
    static var previews: some View {
        let demoExcersizesOne = [Excersize(id: 1, name: "Push"), Excersize(id: 2, name: "Pull"), Excersize(id: 3, name: "Spin")]
        let demoWorkout = Workout(id: 1, name: "Easy One", excersizes: demoExcersizesOne)
        WorkoutEditorRow(workout: .constant(demoWorkout))
    }
}
