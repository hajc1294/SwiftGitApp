//
//  DateExtension.swift
//  GitApp
//
//  Created by Jean Carlo Hernández Arguedas on 26/5/22.
//

import Foundation

///
///
///
extension Date {
    
    ///
    ///
    ///
    var simpleDateFormat: String {
        let format = DateFormatter()
        format.timeZone = TimeZone(abbreviation: "UTC")
        format.dateFormat = "dd/MM/yyyy HH:mm"
        return format.string(from: self)
    }
}
