//
//  WorkoutView.swift
//  twerkout
//
//  Created by Zach Mell on 1/27/22.
//

import SwiftUI

struct WorkoutView: View {
    
    var excersizeList: [Excersize]
    @State var isRestTime: Bool
    var restDuration = 4
    @State var index: Int
    @State var restTimerComplete = false
    
    var body: some View {
        if isRestTime {
            VStack {
                ExcersizeTimer(duration: restDuration, restTimerComplete: $restTimerComplete)
                Button(action: {
                    self.isRestTime = false
                    self.index += 1
                }) {
                    if self.restTimerComplete {
                        Text("Next: \(self.excersizeList[index+1].name)")
                            .font(.callout)
                    }
                }
            }
        } else {
            VStack {
                Text("Do: \(self.excersizeList[index].name)")
                    .font(.title)
                if self.index < self.excersizeList.count-1 {
                    Button(action: {
                        self.isRestTime = true
                    }) {
                        Text("Next: Rest for \(self.restDuration)s")
                            .font(.callout)
                    }
                }
            }
        }
    }
}

struct WorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView(excersizeList:  [
            Excersize(id: 1, durationSeconds: 14, name: "Demo 1"),
            Excersize(id: 2, durationSeconds: 14, name: "Demo 2")
        ], isRestTime: false, index: 0)
    }
}
