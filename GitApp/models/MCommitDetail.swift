//
//  MCommitDetail.swift
//  GitApp
//
//  Created by Jean Carlo Hernández Arguedas on 26/5/22.
//

import Foundation

struct MCommitDetail: Identifiable, Decodable {
    var id: UUID? = UUID()
    var message = String()
    var author = MAuthor()
}
