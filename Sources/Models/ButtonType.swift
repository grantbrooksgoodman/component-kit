//
//  ButtonType.swift
//
//  Created by Grant Brooks Goodman.
//  Copyright © NEOTechnica Corporation. All rights reserved.
//

/* Native */
import Foundation
import SwiftUI

public extension ComponentKit {
    /// The content type for a button's label.
    ///
    /// Use `ButtonType` to describe whether a button displays an
    /// SF Symbol or a styled text string. Pass a button type to
    /// ``ComponentKit/button(_:foregroundColor:secondaryForegroundColor:action:)``:
    ///
    /// ```swift
    /// let type: ComponentKit.ButtonType = .symbol(
    ///     "gear",
    ///     weight: nil,
    ///     usesIntrinsicSize: true
    /// )
    ///
    /// Components.button(
    ///     type,
    ///     foregroundColor: .blue
    /// ) {
    ///     openSettings()
    /// }
    /// ```
    enum ButtonType: Sendable {
        /// A button label that displays an SF Symbol.
        ///
        /// - Parameters:
        ///   - systemName: The name of the system symbol.
        ///   - weight: The font weight applied to the symbol.
        ///   - usesIntrinsicSize: A Boolean value that determines
        ///     whether the symbol renders at its intrinsic size.
        case symbol(
            _ systemName: String,
            weight: SwiftUI.Font.Weight?,
            usesIntrinsicSize: Bool
        )

        /// A button label that displays styled text.
        ///
        /// - Parameters:
        ///   - text: The string to display.
        ///   - font: The font applied to the text.
        ///   - isInspectable: A Boolean value that indicates
        ///     whether the label includes a hidden inspection
        ///     marker.
        case text(
            _ text: String,
            font: ComponentKit.Font,
            isInspectable: Bool
        )
    }
}
