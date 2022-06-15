//
//  RecordView.swift
//  Record
//
//  Created by kimjimin on 2022/06/10.
//

import SwiftUI

struct RecordView: View {
    @EnvironmentObject var store: RecordStore
    @Environment(\.presentationMode) var presentationmode
    @State var large_isSelected = ""
    @State var medium_isSelected = ""
    @State var small_isSelected = ""
    
    var body: some View {
        VStack {
            Button(action:{presentationmode.wrappedValue.dismiss()}){Image(systemName: "xmark")}
                .frame(maxWidth: .infinity, alignment: .trailing).padding(.trailing, 10)
            LargeGridView(large_isSelected: self.$large_isSelected, medium_isSelected: self.$medium_isSelected, small_isSelected: self.$small_isSelected).environmentObject(self.store)
        }
    }
}
