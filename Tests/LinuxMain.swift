import XCTest

import FlakeTests

var tests = [XCTestCaseEntry]()
tests += FlakeTests.allTests()
XCTMain(tests)
