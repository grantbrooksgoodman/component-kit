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

    /// https://developer.apple.com/design/human-interface-guidelines/typography#iOS-iPadOS-Dynamic-Type-sizes
    enum FontScale {
        /* MARK: Cases */

        case custom(CGFloat)

        /// Equivalent to "Title 1" iOS/iPadOS dynamic type size.
        /// - 28 points
        case large

        /// Equivalent to "Body" iOS/iPadOS dynamic type size.
        /// - 17 points
        case medium

        /// Equivalent to "Footnote" iOS/iPadOS dynamic type size.
        /// - 13 points
        case small

        /* MARK: Properties */

        public var points: CGFloat {
            switch self {
            case let .custom(points):
                return points

            case .large:
                return Floats.largeFontScalePointValue

            case .medium:
                return Floats.mediumFontScalePointValue

            case .small:
                return Floats.smallFontScalePointValue
            }
        }
    }
}
