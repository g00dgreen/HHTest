//
//  Fonts.swift
//  HHTest
//
//  Created by Артем Макар on 30.05.24.
//

import Foundation
import SwiftUI

enum FontConstant {
    case title1
    case title2
    case title3
    case title4
    case text1
    case buttonText1
    case buttonText2
    case tabText
    case number
}

extension Font {
    static func appFont(_ fontName: FontConstant) -> Font {
        switch fontName {
        case .title1:
            return .system(size: 22, weight: .semibold)
        case .title2:
            return .system(size: 20, weight: .semibold)
        case .title3:
            return .system(size: 16, weight: .medium)
        case .title4:
            return .system(size: 14, weight: .medium)
        case .text1:
            return .system(size: 14, weight: .regular)
        case .buttonText1:
            return .system(size: 16, weight: .semibold)
        case .buttonText2:
            return .system(size: 14, weight: .regular)
        case .tabText:
            return .system(size: 10, weight: .regular)
        case .number:
            return .system(size: 7, weight: .regular)
        }
    }
}
