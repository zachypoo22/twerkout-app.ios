//
//  WorkoutHistory.swift
//  twerkout
//
//  Created by Zach Mell on 1/29/22.
//

import Foundation

struct WorkoutHistory: Hashable, Codable, Identifiable {
    var id: Int
    var workoutDate: Date
    var workoutName: String
    var activeDuration: Int
    var restDuration: Int
    var totalDuration: Int
}
