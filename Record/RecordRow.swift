//
//  RecordRow.swift
//  Record
//
//  Created by kimjimin on 2022/06/14.
//

import SwiftUI

struct RecordRow: View {
    @EnvironmentObject var store: RecordStore
    let record: Record
    
    var body: some View {
        HStack {
            Text("\(record.large) > \(record.medium) > \(record.small) / \(record.date)")
            Spacer()
            Text("\(record.sugar, specifier: "%.1f")g").bold()
        }
    }
}
