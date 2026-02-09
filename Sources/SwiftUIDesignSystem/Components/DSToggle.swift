//
//  DSToggle.swift
//  SwiftUIDesignSystem
//
//  Created by Ermal Bujupaj on 9.2.26.
//


import SwiftUI

/// A styled toggle switch with label.
///
/// Usage:
/// ```swift
/// DSToggle("Dark Mode", isOn: $isDarkMode)
/// DSToggle("Notifications", isOn: $isEnabled, labelPosition: .trailing)
/// ```
public struct DSToggle: View {
    
    public enum LabelPosition {
        case leading
        case trailing
    }
    
    // MARK: - Properties
    
    let labelPosition: LabelPosition
    
    @Binding private var isOn: Bool
    
    private let label: String
    
    // MARK: - Init
    
    public init(
        _ label: String,
        isOn: Binding<Bool>,
        labelPosition: LabelPosition = .leading
    ) {
        self.label = label
        self._isOn = isOn
        self.labelPosition = labelPosition
    }
    
    // MARK: - Body
    
    public var body: some View {
        HStack {
            if labelPosition == .leading {
                DSText(label, style: .body)
                Spacer()
                toggle
            } else {
                toggle
                Spacer()
                DSText(label, style: .body)
            }
        }
    }

    private var toggle: some View {
        Toggle("", isOn: $isOn)
            .labelsHidden()
            .tint(DSColors.primary)
    }
}

#Preview("Leading Label") {
    @Previewable @State var isOn: Bool = true
    DSToggle("Dark Mode", isOn: $isOn)
        .padding()
}

#Preview("Trailing Label") {
    @Previewable @State var isOn: Bool = false
    DSToggle("Notifications", isOn: $isOn, labelPosition: .trailing)
        .padding()
}

#Preview("Multiple") {
    @Previewable @State var darkMode: Bool = true
    @Previewable @State var notifications: Bool = false
    @Previewable @State var autoSave: Bool = true
    
    VStack(spacing: DSSpacing.md) {
        DSToggle("Dark Mode", isOn: $darkMode)
        DSToggle("Notifications", isOn: $notifications)
        DSToggle("Auto-Save", isOn: $autoSave)
    }
    .padding()
}
