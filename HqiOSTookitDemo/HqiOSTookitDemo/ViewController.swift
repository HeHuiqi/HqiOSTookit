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
        let hstr = HqString.version
        print(hstr)
        let subStr = "1234".hq_subString(range: NSRange.init(location: 1, length: 2))
        print(subStr)
        
        
    }
}

