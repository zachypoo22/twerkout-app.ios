//
//  ExcersizeEditorView.swift
//  twerkout
//
//  Created by Zach Mell on 1/27/22.
//

import SwiftUI

struct ExcersizeEditorView: View {
    
    @Binding var excersize: Excersize
    
    var body: some View {
//        Form {
            VStack {
                HStack {
                    Text("Name").font(.headline)
                    Spacer()
                    TextField("Name", text: $excersize.name)
                }
                Picker("Sets", selection: $excersize.sets) {
                    ForEach(1...10, id: \.self) {
                        Text("\($0)")
                    }
                }
            }
//        }
        
    }
}

struct ExcersizeEditorView_Previews: PreviewProvider {
    static var previews: some View {
        let testExcersize = Excersize(id: 1, name: "Yolo", sets: 3)
        ExcersizeEditorView(excersize: .constant(testExcersize))
    }
}
