//
//  GetViewController.swift
//  IOSTraining4
//
//  Created by Ken Phanith on 2018/05/09.
//  Copyright © 2018 Quad. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import RealmSwift

class GetViewController: UIViewController {
    var btn = UIButton()
    var textView = UITextView()
    var label = UILabel()
}

extension GetViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.view.addSubview(btn)
        self.view.addSubview(textView)
        self.view.addSubview(label)
        
        self.btn.setTitle("Get my Name", for: .normal)
        self.btn.backgroundColor = .blue
        self.btn.snp.makeConstraints({(make) -> Void in
            make.centerX.equalToSuperview()
            make.width.equalTo(view.snp.width).dividedBy(2)
            make.centerY.equalToSuperview()
            make.height.equalTo(70)
        })
        self.btn.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
        
        self.textView.text = "Your Name is :"
        self.textView.snp.makeConstraints({(make) -> Void in
            make.top.equalToSuperview().offset(100)
            make.width.equalTo(view.snp.width).dividedBy(2)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
        })
        
        self.label.snp.makeConstraints({(make) -> Void in
            make.bottom.equalTo(textView).offset(20)
            make.centerX.equalToSuperview()
        })
    }
}

extension GetViewController{
    @objc func btnClicked(){
        self.label.text = self.getData()
    }
}

extension GetViewController{
    func getData() -> String {
        var username : String?
        do {
            let realm = try Realm()
            let result = realm.object(ofType: User.self, forPrimaryKey: ViewController.id)
            guard let name = result?.name else{ return "" }
            username = name
        } catch {
            debugPrint(error)
        }
        return username!
    }
}
