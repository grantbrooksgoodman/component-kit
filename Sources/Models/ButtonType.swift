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
    enum ButtonType {
        case symbol(_ systemName: String, weight: SwiftUI.Font.Weight?, usesIntrinsicSize: Bool)
        case text(_ text: String, font: ComponentKit.Font)
    }
}
