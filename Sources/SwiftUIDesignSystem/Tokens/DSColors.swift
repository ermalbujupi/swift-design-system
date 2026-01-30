//
//  DSColors.swift
//  SwiftUIDesignSystem
//
//  Created by Ermal Bujupaj on 30.1.26.
//

import SwiftUI

/// Design tokens for colors throughout the design system.
///
/// Usage:
/// ```swift
/// Text("Hello")
///     .foregroundStyle(DSColors.primary)
/// 

public enum DSColors {
    
    // MARK: Brand Colors
    
    /// Primary brand color
    public static let primary = Color("DSPrimary", bundle: .module)
    
    /// Secondary color
    public static let secondary = Color("DSSecondary", bundle: .module)
    
    // MARK: Semantic Colors

    /// Success states
    public static let success = Color("DSSuccess", bundle: .module)
    
    /// Warning states
    public static let warning = Color("DSWarning", bundle: .module)
    
    /// Destructive actions
    public static let destructive = Color("DSDestructive", bundle: .module)
    
    // MARK: Neutral Colors
    
    /// Primary text color
    public static let textPrimary = Color("DSTextPrimary", bundle: .module)
    
    /// Secondary/muted text color
    public static let textSecondary = Color("DSTextSecondary", bundle: .module)
    
    /// Primary background
    public static let backgroundPrimary = Color("DSBackgroundPrimary", bundle: .module)
    
    /// Secondary/elevated background
    public static let backgroundSecondary = Color("DSBackgroundSecondary", bundle: .module)
    
    /// Border color
    public static let border = Color("DSBorder", bundle: .module)
}

// MARK: - Fallback Colors (Used when asset catalog colors aren't set up)

public extension DSColors {
    
    enum Fallback {
        public static let primary = Color(hex: "007AFF")
        public static let secondary = Color(hex: "5856D6")
        public static let destructive = Color(hex: "FF3B30")
        public static let success = Color(hex: "34C759")
        public static let warning = Color(hex: "FF9500")
        
        public static let textPrimary = Color(hex: "000000")
        public static let textSecondary = Color(hex: "6B7280")
        public static let backgroundPrimary = Color(hex: "FFFFFF")
        public static let backgroundSecondary = Color(hex: "F3F4F6")
        public static let border = Color(hex: "E5E7EB")
    }
}

// MARK: - Color Hex Initializer

public extension Color {
    
    /// Initialize a Color from a hex string
    /// - Parameter hex: Hex string (with or without #)
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
