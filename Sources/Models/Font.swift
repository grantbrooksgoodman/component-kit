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
    struct Font {
        // MARK: - Properties

        public let scale: FontScale
        public let type: FontType

        // MARK: - Computed Properties

        public var model: SwiftUI.Font {
            switch type {
            case let .custom(name: fontName, isItalic: isItalic, isUnderlined: _):
                let uiFont: UIFont = .init(name: fontName, size: scale.points) ?? .systemFont(ofSize: scale.points)
                return isItalic ? .init(uiFont).italic() : .init(uiFont)

            case let .system(style: style):
                let uiFont: UIFont = .systemFont(ofSize: scale.points, weight: style.weight)
                return style.isItalic ? .init(uiFont).italic() : .init(uiFont)
            }
        }

        // MARK: - Init

        public init(_ type: FontType, scale: FontScale) {
            self.type = type
            self.scale = scale
        }
    }
}
