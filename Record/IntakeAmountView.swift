//
//  IntakeAmountView.swift
//  Record
//
//  Created by kimjimin on 2022/06/10.
//

import SwiftUI
import RealmSwift

struct IntakeAmountView: View {
    @EnvironmentObject var store: RecordStore
    
    @State var Today = Date.now
    @Binding var large_isSelected: String
    @Binding var medium_isSelected: String
    @Binding var small_isSelected: String
    
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    //  TODO: 카테고리가 음료일 때와 아닐 때 구분해야 함
    //  TODO: serving과 연결해서 계산해야 함 (제품당 단위 ex. 음료1캔=190ml)
    let servingCategory = ["1/3", "1/2", "1", "2", "3", "직접 입력"]
    @State var isSelected = [false, false, false, false, false, false]
    
    //  TODO: 데이터베이스로부터 제품 1g당 당류 불러오기 (=sugarAmount)
    var sugarAmount = 1.0
    @State var serving = "" // serving: 섭취량 -> 섭취량도 저장해야하는지
    
    
    var body: some View {
        VStack{
            LazyVGrid(columns: gridItemLayout, spacing: 10) {
                ForEach((0..<servingCategory.count), id: \.self) { num in
                    Button {
                        for temp in 0..<servingCategory.count {
                            self.isSelected[temp] = false
                        }
                        self.isSelected[num].toggle()
                        serving = servingCategory[num]
                    } label: {
                        Text(servingCategory[num])
                            .padding()
                            .foregroundColor(self.isSelected[num] ?Color.white : Color.black)
                    }
                    .frame(width: 100, height: 70)
                    .background(RoundedRectangle(cornerRadius: 15).fill(self.isSelected[num] ? Color.accentColor : Color.white).shadow(radius: 5, y: 3))
                }
            }.padding(.top, 5)
            if(isSelected.last!) {
                TextField("섭취량(g/ml)을 입력하세요.", text: $serving)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(.roundedBorder)
                    .padding(10)
            }
            Spacer()
            Button {
                saveRecord()
                // TODO: pop to Root
                UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true)
            } label: {
                Text("당 \((serving as NSString).doubleValue*sugarAmount, specifier: "%.1f")g 추가하기")
                    .foregroundColor(Color.white)
            }
            .frame(width: 350, height: 50)
            .background(RoundedRectangle(cornerRadius: 30).fill(Color.accentColor))
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Text(small_isSelected)
            }
        }
    }
}



extension IntakeAmountView {
    func saveRecord() {
        store.create(
            date: dateFormatter(date: Today),
            large: large_isSelected,
            medium: medium_isSelected,
            small: small_isSelected,
            sugar: (serving as NSString).doubleValue*sugarAmount)
    }
    
    func dateFormatter(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let converted = formatter.string(from: date)
        return converted
    }
}
