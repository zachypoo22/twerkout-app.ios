//
//  Workout.swift
//  twerkout
//
//  Created by Zach Mell on 1/26/22.
//

import Foundation

struct Workout: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var excersizes: [Excersize]
}
