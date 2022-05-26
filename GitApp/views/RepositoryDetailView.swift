//
//  RepositoryDetailView.swift
//  GitApp
//
//  Created by Jean Carlo Hernández Arguedas on 26/5/22.
//

import SwiftUI


///
///
///
struct RepositoryDetailView: View {
    
    @ObservedObject private var dataViewModel = DataViewModel()
    var repository: MRepository
    
    ///
    ///
    ///
    init(repository: MRepository) {
        self.repository = repository
        self.dataViewModel.getCommits(name: self.repository.name)
    }
    
    ///
    ///
    ///
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Spacer().frame(height: 10)
                Text("\(self.repository.description ?? "")")
                Spacer().frame(height: 5)
                Text("\(self.repository.full_name)")
                    .italic()
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
            List {
                ForEach(self.dataViewModel.commits, id: \.node_id) { commit in
                    CommitCell(commit: commit)
                        .frame(height: 120)
                }
            }
            .padding(.top, 10)
        }
        .navigationTitle("\(self.repository.name)")
        .background(.white)
    }
}

///
///
///
struct RepositoryDetail_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryDetailView(repository: MRepository())
    }
}
