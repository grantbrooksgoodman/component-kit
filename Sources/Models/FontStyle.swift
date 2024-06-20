//
//  FontStyle.swift
//
//  Created by Grant Brooks Goodman.
//  Copyright © NEOTechnica Corporation. All rights reserved.
//

/* Native */
import Foundation
import SwiftUI

public extension ComponentKit {
    enum FontStyle {
        // MARK: - Cases

        case bold(isItalic: Bool = false, isUnderlined: Bool = false)
        case custom(UIFont.Weight, isItalic: Bool = false, isUnderlined: Bool = false)
        case light(isItalic: Bool = false, isUnderlined: Bool = false)
        case medium(isItalic: Bool = false, isUnderlined: Bool = false)
        case regular(isItalic: Bool = false, isUnderlined: Bool = false)
        case semibold(isItalic: Bool = false, isUnderlined: Bool = false)

        // MARK: - Properties

        public var isItalic: Bool {
            switch self {
            case let .bold(isItalic: isItalic, isUnderlined: _),
                 let .custom(_, isItalic: isItalic, isUnderlined: _),
                 let .light(isItalic: isItalic, isUnderlined: _),
                 let .medium(isItalic: isItalic, isUnderlined: _),
                 let .regular(isItalic: isItalic, isUnderlined: _),
                 let .semibold(isItalic: isItalic, isUnderlined: _):
                return isItalic
            }
        }

        public var isUnderlined: Bool {
            switch self {
            case let .bold(isItalic: _, isUnderlined: isUnderlined),
                 let .custom(_, isItalic: _, isUnderlined: isUnderlined),
                 let .light(isItalic: _, isUnderlined: isUnderlined),
                 let .medium(isItalic: _, isUnderlined: isUnderlined),
                 let .regular(isItalic: _, isUnderlined: isUnderlined),
                 let .semibold(isItalic: _, isUnderlined: isUnderlined):
                return isUnderlined
            }
        }

        public var weight: UIFont.Weight {
            switch self {
            case .bold:
                return .bold

            case let .custom(weight, isItalic: _, isUnderlined: _):
                return weight

            case .light:
                return .light

            case .medium:
                return .medium

            case .regular:
                return .regular

            case .semibold:
                return .semibold
            }
        }
    }
}
