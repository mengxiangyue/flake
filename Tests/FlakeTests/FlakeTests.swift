import XCTest
@testable import Flake

final class FlakeTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Flake().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
