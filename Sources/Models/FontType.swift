//
//  FontType.swift
//
//  Created by Grant Brooks Goodman.
//  Copyright © NEOTechnica Corporation. All rights reserved.
//

/* Native */
import Foundation

public extension ComponentKit {
    enum FontType {
        // MARK: - Cases

        case custom(name: String, isItalic: Bool = false, isUnderlined: Bool = false)
        case system(style: FontStyle)

        // MARK: - Properties

        public var name: String? {
            switch self {
            case let .custom(name: name, isItalic: _, isUnderlined: _):
                return name

            case .system:
                return nil
            }
        }
    }
}
