//
//  MainView.swift
//  Record
//
//  Created by kimjimin on 2022/06/12.
//

import SwiftUI
import RealmSwift

struct MainView: View {
    @EnvironmentObject var store: RecordStore
    @State private var isPresented = false
    let records: [Record]

    var body: some View {
        VStack{
            List {
                if records.isEmpty {
                    Text("List is now empty...")
                }
                ForEach(records) { record in
                    RecordRow(record: record).environmentObject(self.store)
                }
            }
            Spacer()
            Button {
                isPresented.toggle()
            } label: {
                Image(systemName: "plus")
            }
            .fullScreenCover(isPresented: $isPresented, content: {RecordView().environmentObject(self.store)})
        }
    }
}
