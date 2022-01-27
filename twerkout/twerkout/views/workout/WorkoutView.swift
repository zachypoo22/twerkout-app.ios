//
//  WorkoutView.swift
//  twerkout
//
//  Created by Zach Mell on 1/27/22.
//

import SwiftUI

struct WorkoutView: View {
    
    var workout: Workout
    @State var isRestTime: Bool
    var restDuration = 4
    @State var index: Int
    @State var restTimerComplete = false
    
    var body: some View {
        VStack {
            Text(workout.name)
                .font(.largeTitle)
            Spacer()
            if isRestTime {
                VStack {
                    RestTimer(duration: restDuration, restTimerComplete: $restTimerComplete)
                    Button(action: {
                        self.isRestTime = false
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
    }
}

struct WorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView(workout: Workout(id: 1, name: "Workout 1", excersizes: [
            Excersize(id: 1, durationSeconds: 14, name: "Demo 1"),
            Excersize(id: 2, durationSeconds: 14, name: "Demo 2")
        ]), isRestTime: false, index: 0)
    }
}
