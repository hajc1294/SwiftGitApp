//
//  MCommit.swift
//  GitApp
//
//  Created by Jean Carlo Hernández Arguedas on 26/5/22.
//

import Foundation

struct MCommit: Identifiable, Decodable {
    var id: UUID? = UUID()
    var sha = String()
    var node_id = String()
    var commit = MCommitDetail()
}
