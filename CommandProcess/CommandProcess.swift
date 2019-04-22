//
//  CommandProcess.swift
//  CommandProcess
//
//  Created by Daisuke T on 2019/04/22.
//  Copyright © 2019 CommandProcess. All rights reserved.
//

import Foundation

// If commands needs privileged then Use SMJobBless.
//
// https://developer.apple.com/documentation/servicemanagement/1431078-smjobbless
public class CommandProcess {
    public struct Result {
        var outputMessage: String
        var errorMessage: String
        
        var hasError: Bool {
            if errorMessage.count > 0 {
                return true
            }
            
            return false
        }
    }
}

public extension CommandProcess {
    private static let shellPath = "/bin/sh"
    
    static func executeShell(_ args: [String]) -> Result {
        return execute(shellPath, args: args)
    }
    
    static func execute(_ path: String, args: [String]) -> Result {
        let process = Process.init()
        let outputPipe = Pipe.init()
        let errorPipe = Pipe.init()
        
        process.launchPath = path
        process.arguments = args
        process.standardOutput = outputPipe
        process.standardError = errorPipe
        
        
        process.launch()
        process.waitUntilExit()
        
        let outputData = outputPipe.fileHandleForReading.readDataToEndOfFile()
        var outputMessage = ""
        if(outputData.count > 0) {
            outputMessage = String(data: outputData, encoding: .utf8) ?? ""
        }
        
        let errorData = errorPipe.fileHandleForReading.readDataToEndOfFile()
        var errorMessage = ""
        if(errorData.count > 0) {
            errorMessage = String(data: errorData, encoding: .utf8) ?? ""
        }
        
        let res = Result(outputMessage: outputMessage, errorMessage: errorMessage)
        
        return res
    }
}
