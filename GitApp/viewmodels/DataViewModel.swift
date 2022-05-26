//
//  DataViewModel.swift
//  GitApp
//
//  Created by Jean Carlo Hernández Arguedas on 26/5/22.
//

import Foundation

///
///
///
class DataViewModel: ObservableObject {
    
    @Published var repositories: [MRepository] = []
    @Published var commits: [MCommit] = []
    @Published var error: Bool = false
   
    ///
    ///
    ///
    func getRepositories() {
        
        ///
        ///
        ///
        URLSession.shared.dataTask(with: Request.createWithToken(path: "\(REPOS_URL + Defaults.getUser())")) {(data, response, err) in
            guard let response = response as? HTTPURLResponse else { return }
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let response = try JSONDecoder().decode(MRepositoriesList.self, from: data)
                        self.repositories = response.items
                    } catch { return }
                }
            } else {
                print("Response: \(response)")
                DispatchQueue.main.async { self.error = true }
            }
        }.resume()
    }
    
    ///
    ///
    ///
    func getCommits(name: String) {
        
        ///
        ///
        ///
        URLSession.shared.dataTask(with: Request.createWithToken(path: "\(COMMITS_BASE_URL + Defaults.getUser())/\(name)/commits")) {(data, response, err) in
            guard let response = response as? HTTPURLResponse else { return }
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        self.commits = try JSONDecoder().decode([MCommit].self, from: data)
                    } catch { return }
                }
            } else {
                print("Response: \(response)")
            }
        }.resume()
    }
}
