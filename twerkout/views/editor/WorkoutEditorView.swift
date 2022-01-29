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
        VStack {
            Form {
                TextField("Name", text: $workout.name)
                ForEach($workout.excersizes) {excersize in
                    ExcersizeEditorView(excersize: excersize)
                }
            }
            Spacer()
            Button(action: {
                addBlankExcersize()
            }) {
                Text("Add New Excersize").foregroundColor(Color.blue)
            }
        }
    }
    
    func addBlankExcersize() {
        workout.excersizes.append(Excersize(id: workout.excersizes.count, name: "Blank", sets: 3))
    }
}

struct WorkoutEditorView_Previews: PreviewProvider {
    static var previews: some View {
        let demoExcersizesOne = [Excersize(id: 1, name: "Push", sets: 2), Excersize(id: 2, name: "Pull", sets: 3), Excersize(id: 3, name: "Spin", sets: 1)]
        let demoWorkout = Workout(id: 1, name: "Easy One", excersizes: demoExcersizesOne)
        WorkoutEditorView(workout: .constant(demoWorkout))
    }
}
