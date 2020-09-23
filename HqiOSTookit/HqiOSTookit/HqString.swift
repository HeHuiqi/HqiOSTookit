//
//  HqString.swift
//  HqiOSTookit
//
//  Created by hehuiqi on 2020/9/18.
//

import Foundation
import UIKit

public class HqString: NSObject {
    public static let libVersion = "1.0"
    
    public static func hq_dicToQueryParams(dic:[String:Any]) -> String {
        let queryParams = dic.reduce(into: [String].init()) { qresult, kv in
            let key = kv.key
            let vaule = kv.value
            qresult.append(key + "=" + "\(vaule)")
        }
        let queryParamStr = queryParams.joined(separator: "&")
        return queryParamStr
    }
    public static func hq_queryParamsToDic(queryParamStr:String) -> [String:Any] {
        let queryParams = queryParamStr.split(separator: "&")
        let queryDic = queryParams.reduce(into: [String:Any].init()) { (dic
                                                                        , str) in
            let equalIndex = str.firstIndex(of: "=")!
            let key = str[..<equalIndex]
            let nextIndex = str.index(equalIndex, offsetBy: 1)
            let value = str[nextIndex...]
            dic["\(key)"] = value
        }
        return queryDic
    }
    public static func hq_isNewVersion(oldVersion:String,newVersion:String) -> Bool {
        let oldVersionSplit = oldVersion.split(separator: ".")
        let newVersionSplit = newVersion.split(separator: ".")
        if oldVersionSplit.count >= newVersionSplit.count {
            for index in 0 ..< newVersionSplit.count {
                let newV = newVersionSplit[index]
                let oldV = oldVersionSplit[index]
                if String(newV) > String(oldV) {
                    return true
                }
            }
            return false
        }else{
            for index in 0 ..< oldVersionSplit.count {
                let newV = newVersionSplit[index]
                let oldV = oldVersionSplit[index]
                if String(newV) > String(oldV) {
                    return true
                }
            }
            return true
        }
    }
}
public extension String{
    
    func hq_subString(range:NSRange) -> String {
        let fromIndex = self.index(self.startIndex, offsetBy: range.location)
        let toIndex = self.index(fromIndex, offsetBy: range.length)
        let sub = self[fromIndex ..< toIndex]
        return "\(sub)"
    }
    func hq_subRangeOfString(subString:String) -> NSRange {
        let range = self.range(of: subString)!
        let location = self.distance(from: self.startIndex, to: range.lowerBound)
        let length = self.distance(from: range.lowerBound, to: range.upperBound)
        return NSRange.init(location: location, length: length)
    }
    func hq_subStringOfRange(range:NSRange) -> String {
        let beginIndex = self.index(self.startIndex, offsetBy: range.location)
        let endIndex = self.index(beginIndex, offsetBy: range.length)
        let result = self[beginIndex..<endIndex]
        return String(result)
    }
    func hq_attributeString(lineSpace:CGFloat) -> NSAttributedString? {
        if self.count > 0 {
            let attr = NSMutableAttributedString.init(string: self)
            let p = NSMutableParagraphStyle.init()
            p.lineSpacing = lineSpace
            attr.addAttribute(NSAttributedString.Key.paragraphStyle, value: p, range: NSRange.init(location: 0, length: self.count))
            return attr
        }
        return nil
    }
    func hq_attributeString(font:UIFont,range:NSRange = NSRange.init(location: 0, length: 0)) -> NSAttributedString? {
        if self.count > 0 {
            let attr = NSMutableAttributedString.init(string: self)
            let setRange = range.length == 0 ? NSRange.init(location: 0, length: self.count): range
            attr.addAttribute(NSAttributedString.Key.font, value: font, range: setRange)
            return attr
        }
        return nil
    }
    func hqAttributeString(font:UIFont,lineSpace:CGFloat) -> NSAttributedString? {
        if self.count > 0 {
            let attr = NSMutableAttributedString.init(string: self)
            let p = NSMutableParagraphStyle.init()
            let range = NSRange.init(location: 0, length: self.count)
            p.lineSpacing = lineSpace
            attr.addAttribute(NSAttributedString.Key.paragraphStyle, value: p, range: range )
            attr.addAttribute(NSAttributedString.Key.font, value: font, range: range)
            return attr
        }
        return nil
    }
    
    func hq_textSize(showSize:CGSize,attributes:[NSAttributedString.Key : Any]? = nil) -> CGSize {
        let size = self.boundingRect(with: showSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributes, context: nil).size
        return size
    }
    func hq_textSize(showSize:CGSize,font:UIFont,lineSpace:CGFloat=0) -> CGSize {
        var attributes:[NSAttributedString.Key:Any] = [:]
        attributes[NSAttributedString.Key.font] = font
        if lineSpace > 0 {
            let p = NSMutableParagraphStyle.init()
            p.lineSpacing = lineSpace
            attributes[NSAttributedString.Key.paragraphStyle] = p
        }
        return self.hq_textSize(showSize: showSize, attributes: attributes)
    }
    func hq_textHeight(showWidth:CGFloat,font:UIFont,lineSpace:CGFloat=0) -> CGFloat {
        let showSize = CGSize.init(width: showWidth, height: 0)
        return self.hq_textSize(showSize: showSize, font: font,lineSpace: lineSpace).height
    }
    func hq_textWidth(showHeight:CGFloat,font:UIFont,lineSpace:CGFloat=0) -> CGFloat {
        let showSize = CGSize.init(width: 0, height: showHeight)
        return self.hq_textSize(showSize: showSize, font: font,lineSpace: lineSpace).height
    }
    func hq_copyToPasteboard(complete:@escaping ()->Void) {
        let pase = UIPasteboard.general
        pase.string = self
        if pase.string != nil {
            complete()
        }
    }
}
