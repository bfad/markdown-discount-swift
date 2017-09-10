import XCTest
@testable import MDDiscount

class MDDiscountTest: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(discount_swift().text, "Hello, World!")
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
