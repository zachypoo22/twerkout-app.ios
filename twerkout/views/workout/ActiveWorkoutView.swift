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
    @State var setCount = 0
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
                            isRestTime = false
                            restTimerComplete = false
//                            self.index += 1
                            if setCount >= workout.excersizes[index].sets {
                                index += 1
                                setCount = 0
                            } else {
                                setCount += 1
                            }
                        }) {
                            if restTimerComplete {
                                Text("Next: \(self.workout.excersizes[index+1].name)")
                                    .font(.callout)
                            }
                        }
                    }
                    Spacer()
                } else {
                    VStack {
                        Text("\(workout.excersizes[index].name) (\(workout.excersizes[index].sets - setCount))")
                            .font(.title)
                            .padding()
                        if index < workout.excersizes.count-1 {
                            Button(action: {
                                isRestTime = true
                            }) {
                                Text("Next: Rest for \(restDuration)s")
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
            Excersize(id: 1, name: "Demo 1", sets: 2),
            Excersize(id: 2, name: "Demo 2", sets: 1),
            Excersize(id: 2, name: "Demo 3", sets: 3),
        ]), restDuration: 6, index: 0, isRestTime: false)
    }
}
