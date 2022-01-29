//
//  ContentView.swift
//  twerkout
//
//  Created by Zach Mell on 1/26/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var isEditMode = false
    @StateObject private var store = WorkoutStore()
    
    var body: some View {
        VStack {
            if isEditMode {
                VStack {
                    Text("Workouts").font(.largeTitle)
                    HStack {
                        Spacer()
                        Button(action: {
                            isEditMode = false
                            WorkoutStore.save(workouts: store.workouts) { result in
                                if case .failure(let error) = result {
                                    fatalError(error.localizedDescription)
                                }
                            }
                        }) {
                            Text("Save").foregroundColor(Color.blue)
                        }
                    }
                    Spacer()
                    MainEditorView(workouts: $store.workouts)
                }
            } else {
                WorkoutSelectorView(isEditMode: $isEditMode, workouts: store.workouts)
            }
        }
        .onAppear {
            WorkoutStore.load { result in
                switch result {
                case .failure(let error):
                    fatalError(error.localizedDescription)
                case .success(let workouts):
                    store.workouts = workouts
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        let demoExcersizesOne = [Excersize(id: 1, name: "Push"), Excersize(id: 2, name: "Pull"), Excersize(id: 3, name: "Spin")]
//        let demoWorkouts = [Workout(id: 1, name: "Easy One", excersizes: demoExcersizesOne), Workout(id: 2, name: "Hard One", excersizes: demoExcersizesOne), ]
        ContentView()
    }
}
