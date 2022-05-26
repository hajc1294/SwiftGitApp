//
//  UserCell.swift
//  GitApp
//
//  Created by Jean Carlo Hernández Arguedas on 26/5/22.
//

import SwiftUI

///
///
///
struct UserCell: View {
    
    var image: String
    var text: String
    
    ///
    ///
    ///
    var body: some View {
        return HStack {
            Image(systemName: self.image)
                .foregroundColor(Color.red_git)
                .font(.system(size: 20))
            Text("\(self.text)")
                .font(.system(size: 12))
            Spacer()
        }
        .padding(.top, 10)
        .padding(.bottom, 10)
    }
}
