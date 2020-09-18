//
//  HqString.swift
//  HqiOSTookit
//
//  Created by hehuiqi on 2020/9/18.
//

import Foundation

public class HqString: NSObject {
    public static let version = "1.0"
}
public extension String{
    
    func hq_subString(range:NSRange) -> String {
        let fromIndex = self.index(self.startIndex, offsetBy: range.location)
        let toIndex = self.index(fromIndex, offsetBy: range.length)
        let sub = self[fromIndex ..< toIndex]
        return "\(sub)"
    }
}
