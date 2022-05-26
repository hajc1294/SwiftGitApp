//
//  StringExtension.swift
//  GitApp
//
//  Created by Jean Carlo Hernández Arguedas on 26/5/22.
//

import Foundation

///
///
///
extension String {
    
    ///
    ///
    ///
    var date: Date {
        let format = DateFormatter()
        format.locale = Locale(identifier: "en_US_POSIX")
        format.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return format.date(from: self) ?? Date()
    }
}
