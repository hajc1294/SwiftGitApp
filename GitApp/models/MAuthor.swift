//
//  MAuthor.swift
//  GitApp
//
//  Created by Jean Carlo Hernández Arguedas on 26/5/22.
//

import Foundation

struct MAuthor: Identifiable, Decodable {
    var id: UUID? = UUID()
    var name = String()
    var email = String()
    var date = String()
}
