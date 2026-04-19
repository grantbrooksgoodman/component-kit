//
//  FontType.swift
//
//  Created by Grant Brooks Goodman.
//  Copyright © NEOTechnica Corporation. All rights reserved.
//

/* Native */
import Foundation

public extension ComponentKit {
    /// The type of a font, distinguishing between custom and
    /// system typefaces.
    ///
    /// Use `FontType` to specify whether a ``Font`` uses a custom
    /// typeface or the system font:
    ///
    /// ```swift
    /// // A system font with medium weight:
    /// let system: ComponentKit.FontType = .system(
    ///     style: .medium()
    /// )
    ///
    /// // A custom font by name:
    /// let custom: ComponentKit.FontType = .custom(
    ///     name: "Avenir-Heavy"
    /// )
    /// ```
    enum FontType: Sendable {
        // MARK: - Cases

        /// A custom typeface identified by its registered font
        /// name.
        ///
        /// - Parameters:
        ///   - name: The registered name of the font.
        ///   - isItalic: A Boolean value that indicates whether
        ///     the font renders in italic. Defaults to `false`.
        ///   - isUnderlined: A Boolean value that indicates
        ///     whether the text renders with an underline.
        ///     Defaults to `false`.
        case custom(
            name: String,
            isItalic: Bool = false,
            isUnderlined: Bool = false
        )

        /// The system typeface.
        ///
        /// - Parameter style: The font's weight and style
        ///   attributes.
        case system(style: FontStyle)

        // MARK: - Properties

        /// The registered name of the font.
        public var name: String? {
            switch self {
            case let .custom(
                name: name,
                isItalic: _,
                isUnderlined: _
            ): name
            case .system: nil
            }
        }
    }
}
