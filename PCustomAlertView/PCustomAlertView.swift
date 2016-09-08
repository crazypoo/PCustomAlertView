//
//  PCustomAlertView.swift
//  PCustomAlertView
//
//  Created by 邓杰豪 on 2016/9/8.
//  Copyright © 2016年 邓杰豪. All rights reserved.
//

import UIKit

protocol PCustomAlertViewDelegate {
    func customAlertView(target customAlertView:PCustomAlertView, clickedButtonAtIndex buttonIndex:NSInteger)
    func customAlertViewWasDismiss()
}

class PCustomAlertView: UIView {

    var titleStr:NSString?
    var middleView:UIView?
    var delegate:PCustomAlertViewDelegate?
    var centerY:CGFloat?
    var titleLabel:UILabel?

    init(initAlertViewWithFrame frame:CGRect,andSuperView superView:UIView,onlyOkButton yesOrNo:Bool ) {
        super.init(frame: frame)

        middleView = UIView.init()
        middleView?.frame = superView.frame
        middleView?.backgroundColor = UIColor.black
        middleView?.alpha = 0.65
        superView.addSubview(middleView!)

        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 8
        self.center = CGPoint.init(x: UIScreen.main.bounds.size.width/2, y: centerY!)
        superView.addSubview(self)

        titleLabel = UILabel.init()
        titleLabel?.frame = CGRect.init(x: 0, y: 15, width: frame.size.width, height: 20)
        titleLabel?.font = UIFont.init(name: "AppleSDGothicNeo-Regular", size: 18)
        titleLabel?.textAlignment = .center
        titleLabel?.backgroundColor = UIColor.clear
        self.addSubview(titleLabel!)

        if yesOrNo == true {
            let confirmF = CGRect.init(x:0, y:frame.size.height-42, width:frame.size.width, height:42)
            let confirmBtn = creatButtonWithFrame(frame: confirmF, title: "确定")
            self.addSubview(confirmBtn)
            confirmBtn.addTarget(self, action: #selector(self.confirmBtnClick), for: .touchUpInside)
            
            let horLine = UIView.init(frame: CGRect.init(x: 0, y: frame.size.height-43, width: frame.size.width, height: 0.5))
            horLine.backgroundColor = setRGB(r: 213, g: 213, b: 215)
            self.addSubview(horLine)
        }
        else
        {
            for i in 0 ..< 2
            {
                let confirmF = CGRect.init(x:(width:frame.size.width/2 * CGFloat(i)), y:frame.size.height-42, width:frame.size.width/2, height:42)
                if i == 0
                {
                    let confirmBtn = creatButtonWithFrame(frame: confirmF, title: "取消")
                    confirmBtn.addTarget(self, action: #selector(self.confirmBtnClick), for: .touchUpInside)
                    self.addSubview(confirmBtn)
                }
                else if (i == 1)
                {
                    let confirmBtn = creatButtonWithFrame(frame: confirmF, title: "确定")
                    confirmBtn.addTarget(self, action: #selector(self.confirmBtnClick), for: .touchUpInside)
                    self.addSubview(confirmBtn)
                }
            }

            let horLine = UIView.init(frame: CGRect.init(x: 0, y: frame.size.height-43, width: frame.size.width, height: 0.5))
            horLine.backgroundColor = setRGB(r: 213, g: 213, b: 215)
            self.addSubview(horLine)

            let verLine = UIView.init(frame: CGRect.init(x: frame.size.width/2-1, y: frame.size.height-43, width: 0.5, height: 43))
            verLine.backgroundColor = horLine.backgroundColor
            self.addSubview(verLine)
        }

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func creatButtonWithFrame(frame:CGRect, title:NSString)->UIButton
    {
        let cancelBtn = UIButton.init(type: .custom)
        cancelBtn.frame = frame
        cancelBtn.setTitleColor(setRGB(r: 0, g: 123, b: 251), for: .normal)
        cancelBtn.setTitle(String(title), for: .normal)
        cancelBtn.titleLabel?.font = UIFont.init(name: "AppleSDGothicNeo-Regular", size: 18)
        return cancelBtn
    }

    func setRGB(r:CGFloat,g:CGFloat,b:CGFloat)->UIColor
    {
        return UIColor.init(colorLiteralRed: Float(r), green: Float(g), blue: Float(b), alpha: 1)
    }

    func leftCancelClick()
    {
        if delegate != nil
        {
            delegate?.customAlertView(target: self, clickedButtonAtIndex: 0)
        }
    }

    func confirmBtnClick()
    {
        if delegate != nil
        {
            delegate?.customAlertView(target: self, clickedButtonAtIndex: 1)
        }
    }

    func dismiss()
    {
        if middleView != nil
        {
            middleView?.removeFromSuperview()
            middleView = nil
        }
        self.removeFromSuperview()
        if delegate != nil
        {
            delegate?.customAlertViewWasDismiss()
        }
    }
}
