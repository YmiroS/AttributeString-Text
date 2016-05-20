//
//  ViewController.swift
//  AttributeString-Text
//
//  Created by liujunbin on 16/5/19.
//  Copyright © 2016年 liujunbin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var vd : [String : AnyObject] = [String : AnyObject]()
    var config : [String : AnyObject]? {
        didSet {

        }
    }

    var lineSpaceV : inputBar = {
        let v = inputBar(title: "设置行间距")
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    var colorV : inputBar = {
        let v = inputBar(title: "设置颜色")
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()


    var rangV : inputBar = {
        let v = inputBar(title: "设置范围")
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    let testStr = "hellow world ! 我该说什么好呢， 啥也不说了。讲个笑话吧，斗个乐子 adqdwqwdwq zzzzzzzzzzzas 大万千瓦的武器"

    var lab : UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false

        v.numberOfLines = 0
        v.lineBreakMode = .ByWordWrapping
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        vd["lineSpaceV"] = lineSpaceV
        vd["colorV"] = colorV
        vd["rangV"] = rangV
        vd["lab"] = lab
        lab.text = testStr
        self.view.addSubview(lineSpaceV)
        self.view.addSubview(colorV)
        self.view.addSubview(rangV)
        self.view.addSubview(lab)
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-[lineSpaceV]-|", options: [], metrics: nil, views: vd))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-[colorV]-|", options: [], metrics: nil, views: vd))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-[rangV]-|", options: [], metrics: nil, views: vd))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-[lab]-|", options: [], metrics: nil, views: vd))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-30-[lineSpaceV(28)]-[colorV(28)]-[rangV(28)]-20-[lab]", options: [], metrics: nil, views: vd))

        renderStr()

    }


    func renderStr(){

        let shadows = NSShadow()
        shadows.shadowBlurRadius = 3
        shadows.shadowColor = UIColor.grayColor()
        shadows.shadowOffset = CGSize(width: -10, height: -10)

        let mutAttr = NSMutableAttributedString(string: testStr)
        mutAttr.addAttributes([NSForegroundColorAttributeName : UIColor.redColor()], range: NSMakeRange(0, 5))
        mutAttr.addAttributes([NSFontAttributeName : UIFont.boldSystemFontOfSize(18)], range: NSMakeRange(6, 10))

        mutAttr.addAttributes([NSBackgroundColorAttributeName : UIColor.greenColor()], range: NSMakeRange(11, 19))

        // 空心字
        mutAttr.addAttributes([NSStrokeColorAttributeName : UIColor.redColor() , NSStrokeWidthAttributeName : 3], range: NSMakeRange(21, 29))

        // 空心字
        mutAttr.addAttributes([NSStrokeColorAttributeName : UIColor.purpleColor() , NSStrokeWidthAttributeName : -3], range: NSMakeRange(30, 38))

        //紫色的中划线
        mutAttr.addAttributes([NSStrikethroughStyleAttributeName : 2], range: NSMakeRange(0, testStr.utf16.count))
        mutAttr.addAttributes([NSStrikethroughColorAttributeName : UIColor.purpleColor()], range: NSMakeRange(0, testStr.utf16.count))
        print(NSUnderlineStyle.PatternDashDotDot.rawValue)
        //下划线
        mutAttr.addAttributes([NSUnderlineStyleAttributeName : 3], range: NSMakeRange(0, testStr.utf16.count))
        mutAttr.addAttributes([NSUnderlineColorAttributeName : UIColor.redColor()], range: NSMakeRange(0, testStr.utf16.count))
        //斜体
        mutAttr.addAttributes([NSObliquenessAttributeName : 1], range: NSMakeRange(0, testStr.utf16.count - 34))

        mutAttr.addAttributes([NSShadowAttributeName : shadows], range: NSMakeRange(0, testStr.utf16.count))


        //段落样式
        let para = NSMutableParagraphStyle()
        para.lineSpacing = 20
        para.alignment = .Right
        mutAttr.addAttribute(NSParagraphStyleAttributeName, value: para, range: NSMakeRange(0, testStr.utf16.count))
        lab.attributedText = mutAttr


    }


}

class inputBar : UIView {


    var titleBlab : UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = UIFont.systemFontOfSize(15)
        v.textColor = UIColor.lightGrayColor()
        return v
    }()

    var inputV : UITextField = {
        let v = UITextField()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.whiteColor()
        v.layer.cornerRadius = 3
        v.layer.borderWidth = 1
        v.layer.borderColor = UIColor.lightGrayColor().CGColor
        v.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 10))
        v.leftViewMode = .Always
        return v
    }()
    var vd : [String : AnyObject] = [String : AnyObject]()
    override init(frame: CGRect) {
        super.init(frame: frame)
        followInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        followInit()
    }

    convenience init(title : String?) {
        self.init()
        titleBlab.text = title
    }

    func followInit(){
        vd["titleBlab"] = titleBlab
        vd["inputV"] = inputV
        self.addSubview(titleBlab)
        self.addSubview(inputV)
        titleBlab.textColor = UIColor.lightGrayColor()
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|[titleBlab(90)]-[inputV(>=180@251)]|", options: [], metrics: nil, views: vd))
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[titleBlab]|", options: [], metrics: nil, views: vd))
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[inputV]|", options: [], metrics: nil, views: vd))



    }
}

