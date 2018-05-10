//
//  Router.swift
//  IOSTraining4
//
//  Created by Ken Phanith on 2018/05/10.
//  Copyright © 2018 Quad. All rights reserved.
//

import Foundation
import UIKit

struct Router {
    var viewController: UIViewController?
    
    init(vc: UIViewController) {
        self.viewController = vc
    }
}

extension Router{
    func navigateToGetScreen(){
        self.viewController?.present(GetViewController(), animated: true, completion: nil)
    }
}
