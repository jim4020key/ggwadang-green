//
//  RecordApp.swift
//  Record
//
//  Created by kimjimin on 2022/06/10.
//

import SwiftUI
import RealmSwift

@main
struct RecordApp: App {
    var body: some Scene {
        let realm = try! Realm()
        WindowGroup {
            ContentView().environmentObject(RecordStore(realm: realm))
        }
    }
}
