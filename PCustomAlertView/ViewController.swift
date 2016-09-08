//
//  ViewController.swift
//  PCustomAlertView
//
//  Created by 邓杰豪 on 2016/9/8.
//  Copyright © 2016年 邓杰豪. All rights reserved.
//

import UIKit

class ViewController: UIViewController,PCustomAlertViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let aaaaa:PCustomAlertView? = PCustomAlertView.init(initAlertViewWithFrame: CGRect.init(x: 0, y: 0, width: 100, height: 200), andSuperView: self.view, onlyOkButton: false)
        aaaaa?.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func customAlertViewWasDismiss() {
        
    }

    func customAlertView(target customAlertView: PCustomAlertView, clickedButtonAtIndex buttonIndex: NSInteger) {
        
    }

}

