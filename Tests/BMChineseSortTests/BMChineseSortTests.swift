import XCTest
@testable import BMChineseSort

final class BMChineseSortTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(BMChineseSort().specialCharSectionTitle, "#")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
