//
//  MUser.swift
//  GitApp
//
//  Created by Jean Carlo Hernández Arguedas on 26/5/22.
//

import Foundation

struct MUser: Identifiable, Decodable {
    var id = Int()
    var name = String()
    var avatar_url = String()
    var html_url = String()
    var company: String? = String()
    var location: String? = String()
    var public_repos = Int()
    var followers = Int()
    var created_at = String()
}
