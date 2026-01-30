//
//  DSButton.swift
//  SwiftUIDesignSystem
//
//  Created by Ermal Bujupaj on 30.1.26.
//


import SwiftUI

/// A styled button component with multiple variants and sizes.
///
/// Usage:
/// ```swift
/// DSButton("Get Started", style: .primary) {
///     print("Tapped!")
/// }
///
/// DSButton("Cancel", style: .secondary, size: .small) {
///     dismiss()
/// }
///
/// DSButton("Delete", style: .destructive, isLoading: true) {
///     deleteItem()
/// }
/// ```
public struct DSButton: View {
    
    // MARK: - Types
    
    public enum Style {
        case primary
        case secondary
        case destructive
        case ghost
    }
    
    public enum Size {
        case small
        case medium
        case large
        
        var verticalPadding: CGFloat {
            switch self {
            case .small: return DSSpacing.xs
            case .medium: return DSSpacing.sm
            case .large: return DSSpacing.md
            }
        }
        
        var horizontalPadding: CGFloat {
            switch self {
            case .small: return DSSpacing.sm
            case .medium: return DSSpacing.md
            case .large: return DSSpacing.lg
            }
        }
        
        var font: Font {
            switch self {
            case .small: return .subheadline.weight(.medium)
            case .medium: return .body.weight(.semibold)
            case .large: return .body.weight(.semibold)
            }
        }
    }
    
    // MARK: - Properties
    
    private let title: String
    private let style: Style
    private let size: Size
    private let isFullWidth: Bool
    private let isLoading: Bool
    private let action: () -> Void
    
    @Environment(\.isEnabled) private var isEnabled
    
    // MARK: - Initialization
    
    /// Creates a new DSButton
    /// - Parameters:
    ///   - title: The button's label text
    ///   - style: Visual style variant (default: .primary)
    ///   - size: Size variant (default: .medium)
    ///   - isFullWidth: Whether button expands to fill available width (default: false)
    ///   - isLoading: Shows loading indicator and disables interaction (default: false)
    ///   - action: Closure executed on tap
    public init(
        _ title: String,
        style: Style = .primary,
        size: Size = .medium,
        isFullWidth: Bool = false,
        isLoading: Bool = false,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.style = style
        self.size = size
        self.isFullWidth = isFullWidth
        self.isLoading = isLoading
        self.action = action
    }
    
    // MARK: - Body
    
    public var body: some View {
        Button(action: action) {
            HStack(spacing: DSSpacing.xs) {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: foregroundColor))
                        .scaleEffect(0.8)
                }
                
                Text(title)
                    .font(size.font)
                    .opacity(isLoading ? 0.7 : 1)
            }
            .frame(maxWidth: isFullWidth ? .infinity : nil)
            .padding(.vertical, size.verticalPadding)
            .padding(.horizontal, size.horizontalPadding)
            .foregroundStyle(foregroundColor)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .strokeBorder(borderColor, lineWidth: hasBorder ? 1 : 0)
            )
        }
        .disabled(isLoading)
        .opacity(isEnabled ? 1 : 0.5)
        .accessibilityLabel(title)
        .accessibilityHint(isLoading ? "Loading" : "")
        .accessibilityAddTraits(.isButton)
    }
    
    // MARK: - Computed Properties
    
    private var foregroundColor: Color {
        switch style {
        case .primary:
            return .white
        case .secondary:
            return DSColors.Fallback.primary
        case .destructive:
            return .white
        case .ghost:
            return DSColors.Fallback.primary
        }
    }
    
    private var backgroundColor: Color {
        switch style {
        case .primary:
            return DSColors.Fallback.primary
        case .secondary:
            return DSColors.Fallback.primary.opacity(0.1)
        case .destructive:
            return DSColors.Fallback.destructive
        case .ghost:
            return .clear
        }
    }
    
    private var borderColor: Color {
        switch style {
        case .primary, .destructive:
            return .clear
        case .secondary:
            return DSColors.Fallback.primary.opacity(0.3)
        case .ghost:
            return .clear
        }
    }
    
    private var hasBorder: Bool {
        style == .secondary
    }
    
    private var cornerRadius: CGFloat {
        switch size {
        case .small: return 6
        case .medium: return 8
        case .large: return 10
        }
    }
}

// MARK: - Previews

#Preview("All Styles") {
    VStack(spacing: DSSpacing.md) {
        DSButton("Primary Button", style: .primary) { }
        DSButton("Secondary Button", style: .secondary) { }
        DSButton("Destructive Button", style: .destructive) { }
        DSButton("Ghost Button", style: .ghost) { }
    }
    .padding()
}

#Preview("All Sizes") {
    VStack(spacing: DSSpacing.md) {
        DSButton("Small", style: .primary, size: .small) { }
        DSButton("Medium", style: .primary, size: .medium) { }
        DSButton("Large", style: .primary, size: .large) { }
    }
    .padding()
}

#Preview("States") {
    VStack(spacing: DSSpacing.md) {
        DSButton("Normal", style: .primary) { }
        DSButton("Loading", style: .primary, isLoading: true) { }
        DSButton("Disabled", style: .primary) { }
            .disabled(true)
        DSButton("Full Width", style: .primary, isFullWidth: true) { }
    }
    .padding()
}