//
//  RepositoryCell.swift
//  GitApp
//
//  Created by Jean Carlo Hernández Arguedas on 26/5/22.
//

import SwiftUI

///
///
///
struct RepositoryCell: View {
    
    var repository: MRepository
    
    ///
    ///
    ///
    var body: some View {
        return GeometryReader { geometry in
            HStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 10) {
                    Spacer()
                    Text("\(self.repository.name)")
                        .font(.system(size: 18)).bold()
                    Text("\(self.repository.description ?? "")")
                        .font(.system(size: 12))
                    Spacer()
                    HStack {
                        Spacer()
                        Image(systemName: "tuningfork")
                            .foregroundColor(.black)
                            .font(.system(size: 12))
                        Text("\(self.repository.forks)")
                            .font(.system(size: 12))
                        Image(systemName: "star")
                            .foregroundColor(.yellow_star)
                            .font(.system(size: 12))
                        Text("\(self.repository.stargazers_count)")
                            .font(.system(size: 12))
                        Image(systemName: "circle.fill")
                            .foregroundColor(Color.getColorByLanguage(language: self.repository.language))
                            .font(.system(size: 12))
                        Text("\(self.repository.language)")
                            .font(.system(size: 12))
                    }
                    Spacer()
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .topLeading)
        }
    }
}

