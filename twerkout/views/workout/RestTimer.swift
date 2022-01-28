//
//  ExcersizeTimer.swift
//  twerkout
//
//  Created by Zach Mell on 1/26/22.
//

import SwiftUI

struct RestTimer: View {
    var duration: Int
    @State var timeRemaining = 0
    @Binding var restTimerComplete: Bool

    var body: some View {
        if restTimerComplete {
            Text("Timer Done")
        } else {
            VStack {
                Text("Rest \(timeRemaining)s").font(.title).onAppear(perform: {
                    startTimer()
                })
                    .background(
                        Circle()
                            .scale(7)
                            .stroke()
                            .shadow(radius: 16)
                            .background(
                                Circle()
                                    .scale(8)
                                    .trim(from:CGFloat(Double(timeRemaining) / Double(duration)), to: 1)
                                    .stroke(lineWidth: 8)
                                    .colorInvert()
                                    .foregroundColor(Color.cyan)
                            )
                    )
            }
        }
    }

    func startTimer() {
        self.timeRemaining += self.duration
        _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                self.restTimerComplete = true
                tempTimer.invalidate()
            }
            
        }
    }

}

struct ExcersizeTimer_Previews: PreviewProvider {
    static var previews: some View {
        RestTimer(duration: 15, restTimerComplete: .constant(false))
    }
}
