//
//  StartWorkoutView.swift
//  twerkout
//
//  Created by Zach Mell on 1/27/22.
//

import SwiftUI

struct StartWorkoutView: View {
    
    var workout: Workout
    @State var selectedDuration = "6"
    
    var body: some View {
        NavigationView {
            VStack {
                Text(workout.name)
                TextField("Duration", text: $selectedDuration)
                    .padding()
                    .keyboardType(.numberPad)
                NavigationLink(destination: ActiveWorkoutView(workout: workout, restDuration: Int(selectedDuration) ?? 30, index: 0, isRestTime: false)) {
                    Text("START")
                }
            }
        }
    }
}

struct StartWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        let testExcersizes = [
            Excersize(id: 1, name: "Demo Excersize 1"),
            Excersize(id: 2, name: "Demo Excersize 2"),
            Excersize(id: 3, name: "Demo Excersize 3"),
        ]
        let testWorkout = Workout(id: 1, name: "Demo Workout", excersizes: testExcersizes)
        StartWorkoutView(workout: testWorkout)
    }
}
