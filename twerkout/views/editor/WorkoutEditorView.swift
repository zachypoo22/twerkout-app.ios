//
//  WorkoutEditorView.swift
//  twerkout
//
//  Created by Zach Mell on 1/27/22.
//

import SwiftUI

struct WorkoutEditorView: View {
    
    @Environment(\.scenePhase) private var scenePhase
    @Binding var workout: Workout
    let saveAction: ()->Void
    
    var body: some View {
        VStack {
            Form {
                TextField("Name", text: $workout.name)
                    .colorInvert().foregroundColor(Color.cyan)
                ForEach($workout.excersizes) {excersize in
                    ExcersizeEditorView(excersize: excersize)
                }
            }.onChange(of: scenePhase) { phase in
                if phase == .inactive {saveAction()}
            }
            Spacer()
            Button(action: {
                addBlankExcersize()
            }) {
                Text("Add New Exersize")
                    .colorInvert().foregroundColor(Color.cyan)
            }
        }
    }
    
    func addBlankExcersize() {
        workout.excersizes.append(Excersize(id: workout.excersizes.count, name: "Blank"))
    }
}

struct WorkoutEditorView_Previews: PreviewProvider {
    static var previews: some View {
        let demoExcersizesOne = [Excersize(id: 1, name: "Push"), Excersize(id: 2, name: "Pull"), Excersize(id: 3, name: "Spin")]
        let demoWorkout = Workout(id: 1, name: "Easy One", excersizes: demoExcersizesOne)
        WorkoutEditorView(workout: .constant(demoWorkout), saveAction: {})
    }
}
