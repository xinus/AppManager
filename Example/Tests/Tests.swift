import AppManager
import XCTest


class InfoTests: XCTestCase {
    func testAppVersion() {
        let appVersion = appMgr.info.appVersion
        XCTAssertEqual("1.0", appVersion, "appMgr.info.appVersion failed.")
    }
    
    func testAppBuild() {
        let appBuild = appMgr.info.appBuild
        XCTAssertEqual("1", appBuild, "appMgr.info.appBuild failed.")
    }
}
