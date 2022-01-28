//
//  WorkoutView.swift
//  twerkout
//
//  Created by Zach Mell on 1/27/22.
//

import SwiftUI

struct ActiveWorkoutView: View {
    
    var workout: Workout
    var restDuration: Int
    @State var index: Int
    @State var isRestTime: Bool
    @State var restTimerComplete = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text(workout.name)
                    .font(.largeTitle)
                Spacer()
                if isRestTime {
                    VStack {
                        RestTimer(duration: restDuration, restTimerComplete: $restTimerComplete)
                        Button(action: {
                            self.isRestTime = false
                            self.restTimerComplete = false // I think
                            self.index += 1
                        }) {
                            if self.restTimerComplete {
                                Text("Next: \(self.workout.excersizes[index+1].name)")
                                    .font(.callout)
                            }
                        }
                    }
                    Spacer()
                } else {
                    VStack {
                        Text("Do: \(self.workout.excersizes[index].name)")
                            .font(.title)
                            .padding()
                        if self.index < self.workout.excersizes.count-1 {
                            Button(action: {
                                self.isRestTime = true
                            }) {
                                Text("Next: Rest for \(self.restDuration)s")
                                    .font(.callout)
                            }
                        }
                    }
                    Spacer()
                }
            }
        }.navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct ActiveWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveWorkoutView(workout: Workout(id: 1, name: "Workout 1", excersizes: [
            Excersize(id: 1, name: "Demo 1"),
            Excersize(id: 2, name: "Demo 2"),
            Excersize(id: 2, name: "Demo 3"),
        ]), restDuration: 6, index: 0, isRestTime: false)
    }
}
