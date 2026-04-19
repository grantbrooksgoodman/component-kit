//
//  FontScale.swift
//
//  Created by Grant Brooks Goodman.
//  Copyright © NEOTechnica Corporation. All rights reserved.
//

/* Native */
import Foundation

public extension ComponentKit {
    // MARK: - Type Aliases

    private typealias Floats = Constants.CGFloats.FontScale

    // MARK: - Types

    /// The point size of a font, corresponding to standard iOS
    /// Dynamic Type sizes.
    ///
    /// Use `FontScale` to specify the size of a ``Font``. The
    /// predefined cases map to standard iOS Dynamic Type sizes:
    ///
    /// - ``large``: 28 points (Title 1)
    /// - ``medium``: 17 points (Body)
    /// - ``small``: 13 points (Footnote)
    ///
    /// Use ``custom(_:)`` to specify an arbitrary point size.
    ///
    /// For more information, see
    /// [Typography](https://developer.apple.com/design/human-interface-guidelines/typography#iOS-iPadOS-Dynamic-Type-sizes)
    /// in the Human Interface Guidelines.
    enum FontScale: Sendable {
        /* MARK: Cases */

        /// A custom point size.
        case custom(CGFloat)

        /// A font size of 28 points, corresponding to the Title 1
        /// Dynamic Type size.
        case large

        /// A font size of 17 points, corresponding to the Body
        /// Dynamic Type size.
        case medium

        /// A font size of 13 points, corresponding to the Footnote
        /// Dynamic Type size.
        case small

        /* MARK: Properties */

        /// The size of the font in points.
        public var points: CGFloat {
            switch self {
            case let .custom(points): points
            case .large: Floats.largeFontScalePointValue
            case .medium: Floats.mediumFontScalePointValue
            case .small: Floats.smallFontScalePointValue
            }
        }
    }
}
