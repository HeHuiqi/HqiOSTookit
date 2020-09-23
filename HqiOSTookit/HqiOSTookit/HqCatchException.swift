//
//  HqCatchException.swift
//  HqiOSTookit
//
//  Created by hehuiqi on 2020/9/22.
//

import Foundation
import MachO

public class HqCatchException: NSObject {
    
    //MARK: - 获取偏移量地址
    public static let shared:HqCatchException = HqCatchException.init()
    
    static func calculateAddress() -> Int {
        var slide = 0
        for index in 0 ..< _dyld_image_count() {
            let macHeader:UnsafePointer<mach_header> = _dyld_get_image_header(index)
            if macHeader.pointee.filetype == MH_EXECUTE {
                slide = _dyld_get_image_vmaddr_slide(index);
                break;
            }
        }
        return slide
    }
    static func saveCrashLog(){
        var mstr = String()
        mstr += "Stack:\n"
        //增加偏移量地址
        mstr = mstr.appendingFormat("slideAdress:0x%0x\r\n", calculateAddress())
        //增加错误信息
        for symbol in Thread.callStackSymbols {
            mstr = mstr.appendingFormat("%@\r\n", symbol)
        }
        let hqfm = HqFileManager.init()
        let contents = mstr.data(using: String.Encoding.utf8)
        let _ = hqfm.hqSaveFile(fileName: hqfm.crashLogFileName, contents: contents)
        
    }
    static let signalHandler = { (_ sig:Int32)->Void in
        saveCrashLog()
        signal(sig, SIG_DFL);
//        exit(signal)
    }
    public func registerSignalHandler(ishandleOtherSignal:Bool = false){
        /*
         如果在运行时遇到意外情况，Swift代码将以SIGTRAP此异常类型终止，例如：
         1.具有nil值的非可选类型
         2.一个失败的强制类型转换
         查看Backtraces以确定遇到意外情况的位置。附加信息也可能已被记录到设备的控制台。您应该修改崩溃位置的代码，以正常处理运行时故障。例如，使用可选绑定而不是强制解开可选的。
         */
        
        let handler :@convention(c) (Int32)->Void = {(_ signal:Int32)->Void in
            HqCatchException.signalHandler(signal)
        }
        signal(SIGABRT,handler)
        signal(SIGSEGV,handler)
        signal(SIGBUS,handler)
        signal(SIGTRAP,handler)
        signal(SIGILL,handler)
        
        
        //如果需要搜集其他信号崩溃则按需打开如下代码
        if ishandleOtherSignal {
            signal(SIGHUP, handler)
            signal(SIGINT, handler)
            signal(SIGQUIT, handler)
            signal(SIGFPE, handler)
            signal(SIGPIPE, handler)
        }
        
        
        /*
         signal(SIGABRT) { (sig) in
         HqCatchException.signalHandler(sig)
         }
         signal(SIGSEGV) { (sig) in
         HqCatchException.signalHandler(sig)
         }
         signal(SIGBUS)  { (sig) in
         HqCatchException.signalHandler(sig)
         }
         signal(SIGTRAP) { (sig) in
         
         HqCatchException.signalHandler(sig)
         }
         signal(SIGILL)  { (sig) in
         HqCatchException.signalHandler(sig)
         }
         */
    }
    deinit {
        print("deinit")
        self.unregisterSignalHandler()
    }
    public func unregisterSignalHandler(){
        signal(SIGINT, SIG_DFL);
        signal(SIGSEGV, SIG_DFL);
        signal(SIGTRAP, SIG_DFL);
        signal(SIGABRT, SIG_DFL);
        signal(SIGILL, SIG_DFL);
        
        signal(SIGHUP, SIG_DFL)
        signal(SIGINT, SIG_DFL)
        signal(SIGQUIT, SIG_DFL)
        signal(SIGFPE, SIG_DFL)
        signal(SIGPIPE, SIG_DFL)
    }
    
    public func catchExceptionHandler()  {
        NSSetUncaughtExceptionHandler { (exception) in
            /*
             print(exception.reason as Any)
             print(exception.name)
             print(exception.callStackSymbols)
             guard let reason = exception.reason else{
             return
             }
             */
            HqCatchException.saveCrashLog()
        }
    }
}
