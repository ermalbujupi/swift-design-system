//
//  DSButtonTests.swift
//  SwiftUIDesignSystem
//
//  Created by Ermal Bujupaj on 30.1.26.
//


import XCTest
import SwiftUI
@testable import SwiftUIDesignSystem

@MainActor
final class DSButtonTests: XCTestCase {
    
    func testButtonInitialization() {
        // Given/When
        let button = DSButton("Test", style: .primary) { }
        
        // Then
        XCTAssertNotNil(button)
    }
    
    func testSpacingValues() {
        // Verify spacing scale follows 4pt grid
        XCTAssertEqual(DSSpacing.none, 0)
        XCTAssertEqual(DSSpacing.xxs, 4)
        XCTAssertEqual(DSSpacing.xs, 8)
        XCTAssertEqual(DSSpacing.sm, 12)
        XCTAssertEqual(DSSpacing.md, 16)
        XCTAssertEqual(DSSpacing.lg, 24)
        XCTAssertEqual(DSSpacing.xl, 32)
        XCTAssertEqual(DSSpacing.xxl, 48)
        XCTAssertEqual(DSSpacing.xxxl, 64)
    }
    
    func testColorHexInitializer() {
        // Test 6-digit hex
        let color = Color(hex: "007AFF")
        XCTAssertNotNil(color)
        
        // Test with hash
        let colorWithHash = Color(hex: "#FF3B30")
        XCTAssertNotNil(colorWithHash)
    }
}
