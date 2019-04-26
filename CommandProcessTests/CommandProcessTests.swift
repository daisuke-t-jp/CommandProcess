//
//  CommandProcessTests.swift
//  CommandProcessTests
//
//  Created by Daisuke T on 2019/04/22.
//  Copyright © 2019 CommandProcess. All rights reserved.
//

import XCTest
@testable import CommandProcess

class CommandProcessTests: XCTestCase {
  
  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testShellVersion() {
    let result = CommandProcess.executeShell(["-c", "sh --version"])
    print(result)
    
    XCTAssert(!result.hasError)
    XCTAssert(result.outputMessage.trimmingCharacters(in: .whitespacesAndNewlines).count > 0)
  }
  
  func testEcho() {
    let string = "Hello World"
    let result = CommandProcess.executeShell(["-c", "echo '\(string)'"])
    print(result)
    
    XCTAssert(!result.hasError)
    XCTAssertEqual(result.outputMessage.trimmingCharacters(in: .whitespacesAndNewlines), string)
  }
  
  func testLS() {
    let result = CommandProcess.executeShell(["-c", "ls"])
    print(result)
    
    XCTAssert(!result.hasError)
    XCTAssert(result.outputMessage.trimmingCharacters(in: .whitespacesAndNewlines).count > 0)
  }
  
  func testPWD() {
    let result = CommandProcess.executeShell(["-c", "pwd"])
    print(result)
    
    XCTAssert(!result.hasError)
    XCTAssert(result.outputMessage.trimmingCharacters(in: .whitespacesAndNewlines).count > 0)
  }
  
  func testCommandError() {
    let result = CommandProcess.executeShell(["-c", "ls /nonexist"])
    print(result)
    
    XCTAssert(result.hasError)
  }
  
  func testCommandNotFoundError() {
    let result = CommandProcess.executeShell(["-c", "invalidcommand"])
    print(result)
    
    XCTAssert(result.hasError)
  }
  
  func testPermissionError() {
    let result = CommandProcess.executeShell(["-c", "purge"])
    print(result)
    
    XCTAssert(result.hasError)
  }
  
  /*
   func testPerformanceExample() {
   // This is an example of a performance test case.
   self.measure {
   // Put the code you want to measure the time of here.
   }
   }
   */
  
}
