//
//  ExcersizeTimer.swift
//  twerkout
//
//  Created by Zach Mell on 1/26/22.
//

import SwiftUI

struct ExcersizeTimer: View {
    var excersize: Excersize
    @State var timeRemaining = 0
    @State var completed = false

    var body: some View {
        if completed {
            Text("Completed \(self.excersize.name)")
        } else {
            VStack {
                Text(self.excersize.name)
                Text("Timer \(self.timeRemaining)").onAppear(perform: {
                    startTimer()
                })
            }
        }
    }

    func startTimer() {
        self.timeRemaining += self.excersize.durationSeconds
        _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                self.completed = true
                tempTimer.invalidate()
            }
            
        }
    }

}

struct ExcersizeTimer_Previews: PreviewProvider {
    static var previews: some View {
        ExcersizeTimer(excersize: Excersize(id: 1, durationSeconds: 15, name: "Demo 1"))
    }
}
