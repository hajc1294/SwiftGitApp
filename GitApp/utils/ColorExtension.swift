//
//  ColorExtension.swift
//  GitApp
//
//  Created by Jean Carlo Hernández Arguedas on 26/5/22.
//

import Foundation
import SwiftUI

///
///
///
extension Color {
    
    static let disable_input = Color(red: 234/255, green: 236/255, blue: 238/255)
    static let hint = Color(red: 192/255, green: 192/255, blue: 192/255)
    static let yellow_star = Color(red: 241 / 255, green: 196 / 255, blue: 15 / 255)
    static let red_git = Color(red: 240 / 255, green: 80 / 255, blue: 51 / 255)
    
    ///
    ///
    ///
    static func getColorByLanguage(language: String) -> Color {
        switch language {
            case "Java":
                return Color(red: 185 / 255, green: 119 / 255, blue: 14 / 255)
            case "Dart":
                return Color(red: 26 / 255, green: 188 / 255, blue: 156 / 255)
            case "Kotlin":
                return Color(red: 175 / 255, green: 122 / 255, blue: 197 / 255)
            case "Swift":
                return Color(red: 231 / 255, green: 76 / 255, blue: 60 / 255)
            case "JavaScript":
                return Color(red: 247 / 255, green: 220 / 255, blue: 111 / 255)
            default:
                return .black
            
        }
    }
}
