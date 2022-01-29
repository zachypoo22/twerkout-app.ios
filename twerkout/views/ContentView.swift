//
//  ContentView.swift
//  twerkout
//
//  Created by Zach Mell on 1/26/22.
//

import SwiftUI

struct ContentView: View {
    
//    @State var workouts: [Workout]
    @State var isEditMode = false
    @StateObject private var store = WorkoutStore()
    
    var body: some View {
        VStack {
            Text("Workouts").font(.largeTitle).foregroundColor(.cyan).colorInvert()
            
            if isEditMode {
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            isEditMode = false
                        }) {
                            Text("Save")
                        }
                    }
                    Spacer()
                    MainEditorView(workouts: $store.workouts) {
                        WorkoutStore.save(workouts: store.workouts) { result in
                            if case .failure(let error) = result {
                                fatalError(error.localizedDescription)
                            }
                        }
                    }
                }
            } else {
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            isEditMode = true
                        }) {
                            Text("Edit")
                        }
                    }
                    Spacer()
                    WorkoutSelectorView(workouts: store.workouts)
                }
            }
        }.colorInvert().background(Color.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        let demoExcersizesOne = [Excersize(id: 1, name: "Push"), Excersize(id: 2, name: "Pull"), Excersize(id: 3, name: "Spin")]
//        let demoWorkouts = [Workout(id: 1, name: "Easy One", excersizes: demoExcersizesOne), Workout(id: 2, name: "Hard One", excersizes: demoExcersizesOne), ]
        ContentView()
    }
}
