//
//  MRepository.swift
//  GitApp
//
//  Created by Jean Carlo Hernández Arguedas on 26/5/22.
//

import Foundation

struct MRepository: Identifiable, Decodable {
    var id = Int()
    var name = String()
    var full_name = String()
    var description: String? = String()
    var created_at = String()
    var stargazers_count = Int()
    var language = String()
    var forks = Int()
    var owner = MOwner()
}
