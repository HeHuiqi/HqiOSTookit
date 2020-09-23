//
//  HqFileManager.swift
//  HqiOSTookit
//
//  Created by hehuiqi on 2020/9/22.
//

import Foundation

public class HqFileManager: NSObject {
    
    public var appDocmentDir:URL? {
        get{
            let urls:[URL] = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            return urls.first
        }
    }
    public var defaultFileName:String{
        get{
            let date = Date.init()
            let dateformatter = DateFormatter.init()
            dateformatter.dateFormat = "yyyyMMddHHmmss"
            return dateformatter.string(from: date)+".txt"
        }
    }
    public var crashLogFileName:String{
        get{
            let date = Date.init()
            let dateformatter = DateFormatter.init()
            dateformatter.dateFormat = "yyyyMMddHHmmss"
            return "crash" + dateformatter.string(from: date)+".log"
        }
    }
    public func hqSaveFile(fileName:String,contents:Data?) -> Bool {
        if contents == nil {
            return false
        }
        guard let docDir = self.appDocmentDir else {
            return false
        }
        let fm  = FileManager.default
        let savePath = docDir.appendingPathComponent(fileName).path
        print(savePath)
        let createSuc = fm.createFile(atPath: savePath, contents: contents, attributes: nil)
        print("createSuc==\(createSuc)")
        return createSuc
    }
    public func hqReadFile(fileName:String) -> Data? {
        guard let docDir = self.appDocmentDir else {
            return nil
        }
        let fm  = FileManager.default
        let filePath = docDir.path + fileName
        if fm.isReadableFile(atPath: filePath) == false {
            return nil
        }
        let contentDatas = fm.contents(atPath: filePath)
        return contentDatas
    }
}
