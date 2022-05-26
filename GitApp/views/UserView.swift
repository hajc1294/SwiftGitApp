//
//  InfoView.swift
//  GitApp
//
//  Created by Jean Carlo Hernández Arguedas on 26/5/22.
//

import SwiftUI

///
///
///
struct UserView: View {
    
    @ObservedObject private var userViewModel = UserviewModel()
    var performCloseAction: () -> ()
    
    ///
    ///
    ///
    init(performCloseAction: @escaping () -> ()) {
        self.performCloseAction = performCloseAction
        self.userViewModel.getUserInfo()
    }
    
    ///
    ///
    ///
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            VStack(alignment: .center) {
                ImageDownloader(url: self.userViewModel.user.avatar_url).aspectRatio(contentMode: .fit)
                    .frame(width: 170, height: 170)
                    .cornerRadius(80)
                Spacer()
                    .frame(height: 20)
                Text("\(self.userViewModel.user.name)")
                    .font(.system(size: 22))
                    .bold()
                Text("\(self.userViewModel.user.html_url)")
            }
            Spacer()
                .frame(height: 40)
            VStack(alignment: .leading) {
                UserCell(image: "building", text: self.userViewModel.user.company ?? "")
                UserCell(image: "location", text: self.userViewModel.user.location ?? "")
                UserCell(image: "cloud", text: "\(self.userViewModel.user.public_repos) \(PUBLIC_REPOS)")
                UserCell(image: "timelapse", text: "\(CREATED_AT) \(self.userViewModel.user.created_at.date.simpleDateFormat)")
            }
            .padding(.leading, 40)
            .padding(.trailing, 40)
            Spacer()
            Button(action: { self.performCloseAction() }, label: {
                Text(CHANGE_ACCOUNT)
                    .foregroundColor(.white)
                    .font(.system(size: 18))
                    .bold()
                    .frame(minWidth: 0, maxWidth: .infinity)
            })
            .frame(height: 60)
            .padding([.leading, .trailing], 0)
            .background(.black)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .navigationTitle(ACCOUNT)
    }
}

///
///
///
struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(performCloseAction: {})
    }
}
