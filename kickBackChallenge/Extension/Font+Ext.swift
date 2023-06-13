//
//  Font+Ext.swift
//  kickBackChallenge
//
//  Created by Ciupac Cristian  on 18.04.2023.
//

import Foundation
import SwiftUI

extension Font {
    enum Stapel {
        case semiBold
        case bold
        case medium
        case light
        case regular
        case thin
        case custom(String)
        
        var value: String {
            switch self {
            case .semiBold:
                return "Gilroy-SemiBold"
            case .bold:
                return "Gilroy-Bold"
            case .medium:
                return "Gilroy-Medium"
            case .light:
                return "Gilroy-Light"
            case .regular:
                return "Gilroy-Regular"
            case .thin:
                return "Gilroy-Thin"
            case .custom(let name):
                return name
            }
        }
    }
    
    static func gilroy(_ type: Stapel, size: CGFloat = 26) -> Font {
        return .custom(type.value, size: size)
    }
}
