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
        HStack {
            Text("Name").font(.headline)
            Spacer()
            TextField("Name", text: $excersize.name)
                .colorInvert().foregroundColor(Color.cyan)
        }
    }
}

struct ExcersizeEditorView_Previews: PreviewProvider {
    static var previews: some View {
        let testExcersize = Excersize(id: 1, name: "Yolo")
        ExcersizeEditorView(excersize: .constant(testExcersize))
    }
}
