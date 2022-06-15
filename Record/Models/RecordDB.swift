//
//  RecordDB.swift
//  Record
//
//  Created by kimjimin on 2022/06/13.
//

import Foundation
import RealmSwift

class RecordDB: Object {
    @objc dynamic var id = 0
    @objc dynamic var date = "" //Date()
    @objc dynamic var large = ""
    @objc dynamic var medium = ""
    @objc dynamic var small = ""
    @objc dynamic var sugar = 0.0
    
    override static func primaryKey() -> String? {
        "id"
    }
}
