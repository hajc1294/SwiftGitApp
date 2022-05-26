//
//  MRepositoriesList.swift
//  GitApp
//
//  Created by Jean Carlo Hernández Arguedas on 26/5/22.
//

import Foundation

struct MRepositoriesList: Identifiable, Decodable {
    var id: UUID? = UUID()
    var total_count = Int()
    var incomplete_results = Bool()
    var items: [MRepository] = []
}
