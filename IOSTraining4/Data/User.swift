//
//  User.swift
//  IOSTraining4
//
//  Created by Ken Phanith on 2018/05/10.
//  Copyright © 2018 Quad. All rights reserved.
//

import RealmSwift
final class User: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
