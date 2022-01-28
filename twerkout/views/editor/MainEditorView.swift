//
//  MainEditorView.swift
//  twerkout
//
//  Created by Zach Mell on 1/27/22.
//

import SwiftUI

struct MainEditorView: View {
    
    @Binding var workouts: [Workout]
    let saveAction: ()->Void
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach($workouts) { workout in
                        NavigationLink {
                            WorkoutEditorView(workout: workout) {
                                saveAction()
                            }
                        } label: {
                            WorkoutEditorRow(workout: workout)
                        }
                    }
                }
            }
            Spacer()
            Button(action: {
                workouts.append(Workout(id: workouts.count, name: "Blank", excersizes: []))
            }) {
                Text("Add New Workout")
            }
        }
    }
}

struct MainEditorView_Previews: PreviewProvider {
    static var previews: some View {
        let demoExcersizesOne = [Excersize(id: 1, name: "Push"), Excersize(id: 2, name: "Pull"), Excersize(id: 3, name: "Spin")]
        let demoWorkouts = [Workout(id: 1, name: "Easy One", excersizes: demoExcersizesOne), Workout(id: 2, name: "Hard One", excersizes: demoExcersizesOne)]
        MainEditorView(workouts: .constant(demoWorkouts), saveAction: {})
    }
}
