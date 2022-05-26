//
//  MOwner.swift
//  GitApp
//
//  Created by Jean Carlo Hernández Arguedas on 26/5/22.
//

import Foundation

struct MOwner: Identifiable, Decodable {
    var id = Int()
    var login = String()
    var url = String()
}
