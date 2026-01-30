//
//  DSSpacing.swift
//  SwiftUIDesignSystem
//
//  Created by Ermal Bujupaj on 30.1.26.
//

import SwiftUI

/// Design tokens for spacing throughout the design system.
///
/// Based on a 4pt grid system for consistency.
///
/// Usage:
/// ```swift
/// VStack(spacing: DSSpacing.md) {
///     // content
/// }
/// .padding(DSSpacing.lg)
/// ```
public enum DSSpacing {
    
    /// 0pt - No spacing
    public static let none: CGFloat = 0
    
    /// 4pt - Minimal spacing (icon padding, tight groups)
    public static let xxs: CGFloat = 4
    
    /// 8pt - Extra small spacing
    public static let xs: CGFloat = 8
    
    /// 12pt - Small spacing
    public static let sm: CGFloat = 12
    
    /// 16pt - Medium spacing (default)
    public static let md: CGFloat = 16
    
    /// 24pt - Large spacing
    public static let lg: CGFloat = 24
    
    /// 32pt - Extra large spacing
    public static let xl: CGFloat = 32
    
    /// 48pt - 2x large spacing
    public static let xxl: CGFloat = 48
    
    /// 64pt - 3x large spacing (section breaks)
    public static let xxxl: CGFloat = 64
}

// MARK: - Spacing Scale Reference
/*
 
 Spacing Scale (4pt base):
 
 none  = 0pt   - No spacing
 xxs   = 4pt   - Minimal (icon padding)
 xs    = 8pt   - Tight spacing
 sm    = 12pt  - Small gaps
 md    = 16pt  - Default/comfortable
 lg    = 24pt  - Generous spacing
 xl    = 32pt  - Section padding
 xxl   = 48pt  - Large sections
 xxxl  = 64pt  - Page-level breaks
 
 */
