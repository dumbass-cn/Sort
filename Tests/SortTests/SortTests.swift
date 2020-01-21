import XCTest
@testable import Sort

final class SortTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        
        let output = Array(1..<8)
        let input = Array(output.reversed())

        XCTAssertEqual(bubbleSorted(input), output)
        XCTAssertEqual(selectionSorted(input), output)

    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
