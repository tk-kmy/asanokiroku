import XCTest

final class asanokirokuUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testAppLaunches() throws {
        let app = XCUIApplication()
        app.launch()
        XCTAssertTrue(app.staticTexts["あさのきろく"].waitForExistence(timeout: 5))
    }
}
