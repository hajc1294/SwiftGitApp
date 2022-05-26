//
//  CommitCell.swift
//  GitApp
//
//  Created by Jean Carlo Hernández Arguedas on 26/5/22.
//

import SwiftUI

///
///
///
struct CommitCell: View {
    
    var commit: MCommit
    
    ///
    ///
    ///
    var body: some View {
        return GeometryReader { geometry in
            HStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 10) {
                    Spacer()
                    Text("\(self.commit.commit.message)")
                        .font(.system(size: 16)).bold()
                    Text("\(self.commit.commit.author.name)")
                        .font(.system(size: 12))
                    Text("\(self.commit.commit.author.email)")
                        .font(.system(size: 12))
                    HStack {
                        Spacer()
                        Text("\(self.commit.commit.author.date.date.simpleDateFormat)")
                            .font(.system(size: 10))
                    }
                    Spacer()
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .topLeading)
        }
    }
}
