//
//  Font.swift
//
//  Created by Grant Brooks Goodman.
//  Copyright © NEOTechnica Corporation. All rights reserved.
//

/* Native */
import Foundation
import SwiftUI

public extension ComponentKit {
    /// A value that describes a font's type and scale.
    ///
    /// Use `Font` to configure the typeface for text and button
    /// components. Combine a ``FontType`` with a ``FontScale`` to
    /// define the font's style and point size:
    ///
    /// ```swift
    /// let heading = ComponentKit.Font(
    ///     .system(style: .bold()),
    ///     scale: .large
    /// )
    ///
    /// Components.text(
    ///     "Settings",
    ///     font: heading,
    ///     foregroundColor: .primary
    /// )
    /// ```
    ///
    /// For common configurations, use the static properties
    /// and methods:
    ///
    /// ```swift
    /// // Body-sized bold system font (17 points):
    /// .systemBold
    ///
    /// // Title-sized semibold system font (28 points):
    /// .systemSemibold(scale: .large)
    /// ```
    ///
    /// To use a custom typeface, pass a
    /// ``FontType/custom(name:isItalic:isUnderlined:)`` value
    /// with the font's registered name:
    ///
    /// ```swift
    /// let font = ComponentKit.Font(
    ///     .custom(name: "Avenir-Heavy"),
    ///     scale: .medium
    /// )
    /// ```
    ///
    /// - SeeAlso: ``FontType``, ``FontScale``, ``FontStyle``
    struct Font: Sendable {
        // MARK: - Properties

        /// The scale of the font, which defines its
        /// point size.
        public let scale: FontScale

        /// The type of font, which defines its weight
        /// and style.
        public let type: FontType

        // MARK: - Computed Properties

        /// The SwiftUI font representation of this value.
        ///
        /// This property converts the font's type and scale into
        /// a `SwiftUI.Font` suitable for use with SwiftUI views.
        /// For custom fonts, if the specified font name is
        /// unavailable, the system font at the same point size is
        /// used as a fallback.
        public var model: SwiftUI.Font {
            switch type {
            case let .custom(
                name: fontName,
                isItalic: isItalic,
                isUnderlined: _
            ):
                let uiFont: UIFont = .init(
                    name: fontName,
                    size: scale.points
                ) ?? .systemFont(ofSize: scale.points)
                return isItalic ? .init(uiFont).italic() : .init(uiFont)

            case let .system(style: style):
                let uiFont: UIFont = .systemFont(
                    ofSize: scale.points,
                    weight: style.weight
                )
                return style.isItalic ? .init(uiFont).italic() : .init(uiFont)
            }
        }

        // MARK: - Init

        /// Creates a font with the specified type and scale.
        ///
        /// - Parameters:
        ///   - type: The type of font, which defines its weight
        ///     and style.
        ///   - scale: The scale of the font, which defines its
        ///     point size.
        public init(
            _ type: FontType,
            scale: FontScale
        ) {
            self.type = type
            self.scale = scale
        }
    }
}
