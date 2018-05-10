//
//  ViewController.swift
//  IOSTraining4
//
//  Created by Ken Phanith on 2018/05/09.
//  Copyright © 2018 Quad. All rights reserved.
//

import UIKit
import SnapKit
import RealmSwift

class ViewController: UIViewController {
    var label = UILabel()
    var textField = UITextField()
    var btn = UIButton()
    
    static var id: Int = Int(arc4random())
    
    let presenter: Presenter = Presenter()
}

extension ViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(label)
        self.view.addSubview(textField)
        self.view.addSubview(btn)
        
        self.label.text = "Input your name"
        self.label.snp.makeConstraints({(make) -> Void in
            make.size.greaterThanOrEqualTo(150)
            make.left.equalToSuperview().offset(50)
        })
        
        self.textField.backgroundColor = UIColor.gray
        self.textField.snp.makeConstraints({(make) -> Void in
            make.bottom.equalTo(label).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(view.snp.width).dividedBy(1.3)
            make.height.equalTo(70)
        })
        
        self.btn.setTitle("Submit", for: .normal)
        self.btn.backgroundColor = UIColor.blue
        self.btn.addTarget(self, action: #selector(submit), for: .touchUpInside)
        self.btn.snp.makeConstraints({(make) -> Void in
            make.bottom.equalTo(textField).offset(150)
            make.centerX.equalToSuperview()
            make.width.equalTo(view.snp.width).dividedBy(2)
            make.height.equalTo(70)
        })
    }
}

extension ViewController{
    @objc func submit(){
        ViewController.id = ViewController.id + 1
        presenter.storeRequest(name: textField.text!, id: ViewController.id)
        self.present(GetViewController(), animated: true, completion: nil)
    }
}

