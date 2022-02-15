//
//  WorkoutHistoryDto.swift
//  twerkout
//
//  Created by Zach Mell on 1/29/22.
//

import Foundation

struct WorkoutHistoryDto: Hashable, Codable, Identifiable {
    var id: Int
    var workoutDate: Date
    var totalDuration: Int
    var workout: Workout
}

func convertToWoroutHistory(dto: WorkoutHistoryDto) -> WorkoutHistory {
    return WorkoutHistory(id: 2, workoutDate: dto.workoutDate, workoutName: dto.workout.name, activeDuration: 0, restDuration: 0, totalDuration: 0)
}
