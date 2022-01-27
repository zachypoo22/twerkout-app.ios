//
//  ExcersizeRepView.swift
//  twerkout
//
//  Created by Zach Mell on 1/26/22.
//

import SwiftUI

struct ExcersizeRepView: View {
    var excersizeList: [Excersize]
    var index: Int
    var body: some View {
        if index + 1 >= excersizeList.count {
            Text("Done")
        } else {
           Text("Nothing yet")
        }
    }
}

struct ExcersizeRepView_Previews: PreviewProvider {
    static var previews: some View {
        ExcersizeRepView(excersizeList: [
            Excersize(id: 1, durationSeconds: 14, name: "Demo 1"),
            Excersize(id: 2, durationSeconds: 14, name: "Demo 2")
        ], index: 0)
    }
}
