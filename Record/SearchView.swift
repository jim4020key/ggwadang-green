//
//  SearchView.swift
//  Record
//
//  Created by kimjimin on 2022/06/10.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var store: RecordStore
    @State var query = ""
    
    //  TODO: 검색을 위한 모든 소분류카테고리 불러오기
    var allCategories = ["1.square", "2.square", "3.square", "4.square", "5.square", "6.square", "7.square", "8.square", "9.square", "10.square"]
    //  TODO: 데이터 베이스로부터 해당 소분류의 중분류와 대분류 가져오기 -> IntakeAmountView로 전달
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(searchResults, id:\.self) { name in
                    NavigationLink(destination: Text(name)) {
                        Text(name)
                    }
                }
            }
            .searchable(text: $query, placement: .navigationBarDrawer(displayMode: .always), prompt:"검색어를 입력해주세요")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    var searchResults: [String] {
        if query.isEmpty {return allCategories}
        else{
            return allCategories.filter {$0.contains(query)}
        }
    }
}
