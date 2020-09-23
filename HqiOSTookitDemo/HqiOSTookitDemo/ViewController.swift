//
//  ViewController.swift
//  HqiOSTookitDemo
//
//  Created by hehuiqi on 2020/9/18.
//

import UIKit
import HqiOSTookit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = UIButton.init(frame: CGRect.init(x: 20, y: 150, width: 100, height: 50))
        btn.setTitle("Click", for: UIControl.State.normal)
        btn.setTitleColor(UIColor.red, for: UIControl.State.normal)
        self.view.addSubview(btn)
        
        btn.addTarget(self, action: #selector(btnClick), for: UIControl.Event.touchUpInside)
        
    }
    @objc func btnClick(){
//        self.getArrayValue()
        let arr = Thread.callStackSymbols
        let nums =  Thread.callStackReturnAddresses
        let t = Thread.current
        print(t)

        print(t.name as Any)
        print(arr)
        print("\n\n")
        print(nums)

        
    }
    func getArrayValue()  {
        let array:[Int] = []
        print(array[0])
    }
}

