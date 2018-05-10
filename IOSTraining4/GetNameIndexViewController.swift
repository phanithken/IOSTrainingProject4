//
//  GetNameIndexViewController.swift
//  IOSTraining4
//
//  Created by Ken Phanith on 2018/05/09.
//  Copyright © 2018 Quad. All rights reserved.
//

import UIKit
import SnapKit

class GetNameIndexViewController: UIViewController {
    var getNameBtn = UIButton()
}

extension GetNameIndexViewController{
    override func viewDidLoad(){
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "Get Name"
        self.view.addSubview(getNameBtn)
        
        self.getNameBtn.setTitle("Get my Name", for: .normal)
        self.getNameBtn.backgroundColor = UIColor.blue
        self.getNameBtn.snp.makeConstraints({(make) -> Void in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalTo(view.snp.width).dividedBy(2)
            make.height.equalTo(70)
        })
        
        self.getNameBtn.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
    }
}

extension GetNameIndexViewController{
    @objc func btnClicked(){
        let nameData = UILabel()
        nameData.text = "Your Name is\nSomething"
        let detailViewcontroller = UIViewController()
        detailViewcontroller.view.backgroundColor = .white
        detailViewcontroller.view.addSubview(nameData)
        nameData.snp.makeConstraints({(make) -> Void in
            make.size.equalTo(150)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(30)
        })
        self.navigationController?.pushViewController(detailViewcontroller, animated: true)
    }
}
