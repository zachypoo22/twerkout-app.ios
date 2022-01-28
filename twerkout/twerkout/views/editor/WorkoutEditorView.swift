//
//  WorkoutEditorView.swift
//  twerkout
//
//  Created by Zach Mell on 1/27/22.
//

import SwiftUI

struct WorkoutEditorView: View {
    
    @Binding var workout: Workout
    
    var body: some View {
        Form {
            TextField("Name", text: $workout.name)
            ForEach($workout.excersizes) {excersize in
                ExcersizeEditorView(excersize: excersize)
            }
        }
    }
}

struct WorkoutEditorView_Previews: PreviewProvider {
    static var previews: some View {
        let demoExcersizesOne = [Excersize(id: 1, name: "Push"), Excersize(id: 2, name: "Pull"), Excersize(id: 3, name: "Spin")]
        let demoWorkout = Workout(id: 1, name: "Easy One", excersizes: demoExcersizesOne)
        WorkoutEditorView(workout: .constant(demoWorkout))
    }
}
