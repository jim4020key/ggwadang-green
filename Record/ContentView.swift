//
//  ContentView.swift
//  Record
//
//  Created by kimjimin on 2022/06/10.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: RecordStore
    var body: some View {
        MainView(records: store.records)
    }
}
