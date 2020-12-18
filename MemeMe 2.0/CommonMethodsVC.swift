//
//  CommonMethodsVC.swift
//  MemeMe 2.0
//
//  Created by Alexandre Bianchi on 18/12/20.
//  Copyright © 2020 Udacity. All rights reserved.
//

import Foundation

class CommonMethodsVC {
    static let shared = CommonMethodsVC()
    
    var locationGranted: Bool?
    //Initializer access level change now
    private init(){}
    
    func requestForLocation(){
        //Code Process
        locationGranted = true
        print("Location granted")
    }
}
