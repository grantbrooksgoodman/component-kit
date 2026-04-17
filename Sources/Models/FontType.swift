//
//  FontType.swift
//
//  Created by Grant Brooks Goodman.
//  Copyright © NEOTechnica Corporation. All rights reserved.
//

/* Native */
import Foundation

public extension ComponentKit {
    enum FontType: Sendable {
        // MARK: - Cases

        case custom(
            name: String,
            isItalic: Bool = false,
            isUnderlined: Bool = false
        )

        case system(style: FontStyle)

        // MARK: - Properties

        var name: String? {
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
