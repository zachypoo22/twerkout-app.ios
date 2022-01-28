//
//  ContentView.swift
//  twerkout
//
//  Created by Zach Mell on 1/26/22.
//

import SwiftUI

struct ContentView: View {
    
    @Binding var workouts: [Workout]
    
    var body: some View {
        VStack {
            Text("Workouts").font(.largeTitle)
            MainEditorView(workouts: $workouts)
//            WorkoutSelectorView(workouts: workouts)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let demoExcersizesOne = [Excersize(id: 1, name: "Push"), Excersize(id: 2, name: "Pull"), Excersize(id: 3, name: "Spin")]
        let demoWorkouts = [Workout(id: 1, name: "Easy One", excersizes: demoExcersizesOne), Workout(id: 2, name: "Hard One", excersizes: demoExcersizesOne), ]
        ContentView(workouts: .constant(demoWorkouts))
    }
}
