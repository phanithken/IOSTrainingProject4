//
//  Presenter.swift
//  IOSTraining4
//
//  Created by Ken Phanith on 2018/05/10.
//  Copyright © 2018 Quad. All rights reserved.
//

import RealmSwift
class Presenter {
    var router: Router?
    init(router: Router) {
        self.router = router
    }
    
    func storeRequest(name: String, id: Int) -> Void{
        router?.navigateToGetScreen()
        print(name)
        let data = User(value: ["id": id, "name": name])
        do{
            let realm = try Realm()
            try realm.write({ () -> Void in
                realm.add(data)
            })
        }catch let error as NSError{
            debugPrint(error)
        }
    }
}
