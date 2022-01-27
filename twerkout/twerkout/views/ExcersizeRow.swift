//
//  ExcersizeRow.swift
//  twerkout
//
//  Created by Zach Mell on 1/26/22.
//

import SwiftUI

struct ExcersizeRow: View {
    var exersize: Excersize
    var body: some View {
        HStack {
            Text(exersize.name)
            Text(String(exersize.durationSeconds) + "s")
        }
    }
}

struct ExcersizeRow_Previews: PreviewProvider {
    static var previews: some View {
        ExcersizeRow(exersize: Excersize(id: 1, durationSeconds: 45, name: "Demo"))
    }
}
