//
//  ExcersizeRow.swift
//  twerkout
//
//  Created by Zach Mell on 1/26/22.
//

import SwiftUI

struct ExcersizeRow: View {
    var workout: Workout
    var body: some View {
        HStack {
            Text(workout.name)
                .colorInvert()
                .foregroundColor(Color.cyan)
        }
    }
}

struct ExcersizeRow_Previews: PreviewProvider {
    static var previews: some View {
        ExcersizeRow(workout: Workout(id: 1, name: "Test1", excersizes: []))
    }
}
