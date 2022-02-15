//
//  WorkoutStore.swift
//  twerkout
//
//  Created by Zach Mell on 1/27/22.
//

import Foundation
import SwiftUI

class WorkoutHistoryStore: ObservableObject {
    @Published var workoutHistory: [WorkoutHistory] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("workoutHistory.data")
    }
    
    static func save(histories: [WorkoutHistory], completion: @escaping (Result<Int, Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(histories)
                let outfile = try fileURL()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(histories.count))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    static func load(completion: @escaping (Result<[WorkoutHistory], Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                let history = try JSONDecoder().decode([WorkoutHistory].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(history))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
