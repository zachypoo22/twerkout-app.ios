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
    @State var workoutTime = 0
    @State var workoutComplete = false
    @State var index: Int
    @State var setCount = 1
    @State var isRestTime: Bool
    @State var restTimerComplete = false
    
    var body: some View {
        NavigationView {
            if workoutComplete {
                WorkoutSummaryView()
            } else {
                VStack {
                    Text(workout.name)
                        .font(.largeTitle)
                    Text("Workout Time \(workoutTime / 2)s")
                    Spacer()
                    if isRestTime {
                        VStack {
                            RestTimer(duration: restDuration, restTimerComplete: $restTimerComplete)
                            Button(action: {
                                isRestTime = false
                                restTimerComplete = false
                                if setCount >= workout.excersizes[index].sets {
                                    index += 1
                                    setCount = 1
                                } else {
                                    setCount += 1
                                }
                            }) {
                                if restTimerComplete {
                                    Text("Continue")
                                        .onAppear(perform: {
                                            playAVSound(sound: "chrip.wav", type: "wav")
                                        })
                                }
                            }
                        }
                        Spacer()
                    } else {
                        VStack {
                            Text("\(workout.excersizes[index].name) (\(setCount) / \(workout.excersizes[index].sets))")
                                .font(.title)
                                .padding()
                            if index < workout.excersizes.count-1 || setCount < workout.excersizes[index].sets {
                                Button(action: {
                                    isRestTime = true
                                }) {
                                    Text("Next: Rest for \(restDuration)s")
                                        .font(.callout)
                                }
                            } else {
                                Button(action: {
                                    workoutComplete = true
                                }) {
                                    Text("Complete Workout")
                                }
                            }
                        }
                        Spacer()
                    }
                }.onAppear(perform: {
                    startTimer()
                })
            }
        }.navigationBarTitle("")
        .navigationBarHidden(true)
    }
    
    func startTimer() {
        _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
            if workoutComplete {
                tempTimer.invalidate()
            } else {
                workoutTime += 1
            }
        }
    }
    
}

struct ActiveWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveWorkoutView(workout: Workout(id: 1, name: "Workout 1", excersizes: [
            Excersize(id: 1, name: "Demo 1", sets: 1),
//            Excersize(id: 2, name: "Demo 2", sets: 1),
//            Excersize(id: 3, name: "Demo 3", sets: 3),
        ]), restDuration: 6, index: 0, isRestTime: false)
    }
}
