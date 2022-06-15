//
//  LargeGridView.swift
//  Record
//
//  Created by kimjimin on 2022/06/10.
//

import SwiftUI

struct LargeGridView: View {
    @EnvironmentObject var store: RecordStore
    @Binding var large_isSelected: String
    @Binding var medium_isSelected: String
    @Binding var small_isSelected: String
    
    // FIXME: 대분류 확정되면 변경
    let largeArray = [["베이커리","🥐"], ["과자","🍪"], ["음료","🥤"], ["아이스크림","🍦"], ["캔디,젤리,양갱","🍬"], ["초콜릿,캐러멜","🍫"], ["유가공품","🥛"], ["떡","🍡"],["견과류","🥜"]]
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView{
            VStack {
                NavigationLink(destination: SearchView().environmentObject(self.store)) {
                    Text("검색")
                    Image(systemName: "magnifyingglass")
                }
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarHidden(true)
                .frame(maxWidth: .infinity, alignment: .trailing).padding(.trailing, 10)
                
                ScrollView {
                    LazyVGrid(columns: gridItemLayout, spacing: 10) {
                        ForEach((0..<largeArray.count), id: \.self) { num in
                            NavigationLink(destination: MediumGridView(large_isSelected: self.$large_isSelected, medium_isSelected: self.$medium_isSelected, small_isSelected: self.$small_isSelected).environmentObject(self.store)) {
                                VStack {
                                    Text(largeArray[num][1])
                                    Text(largeArray[num][0]).foregroundColor(.black)
                                }
                            }
                            .simultaneousGesture(TapGesture().onEnded {
                                large_isSelected=largeArray[num][0]
                            })
                            .navigationBarTitle("", displayMode: .inline)
                            .navigationBarHidden(true)
                            .frame(width: 110, height: 110)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.white).shadow(radius: 5, y: 3))
                        }
                    }.padding(.top, 5)
                }
            }
        }
    }
}
