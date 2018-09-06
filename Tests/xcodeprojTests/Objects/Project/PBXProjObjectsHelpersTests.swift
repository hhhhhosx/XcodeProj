import Foundation
@testable import xcodeproj
import XCTest

final class PBXProjObjectsHelpersTests: XCTestCase {
    var subject: PBXObjects!

    override func setUp() {
        super.setUp()
        subject = PBXObjects(objects: [])
    }

    func test_targetsNamed_returnsTheCorrectValue() {
        let nativeTarget = PBXNativeTarget(name: "test", buildConfigurationList: nil)
        let legacyTarget = PBXLegacyTarget(name: "test", buildConfigurationList: nil)
        let aggregateTarget = PBXAggregateTarget(name: "test", buildConfigurationList: nil)
        subject.addObject(nativeTarget)
        subject.addObject(legacyTarget)
        subject.addObject(aggregateTarget)
        let got = subject.targets(named: "test").map { $0 }
        XCTAssertTrue(got.contains(nativeTarget))
        XCTAssertTrue(got.contains(legacyTarget))
        XCTAssertTrue(got.contains(aggregateTarget))
    }
}
