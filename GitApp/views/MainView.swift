//
//  MainView.swift
//  GitApp
//
//  Created by Jean Carlo Hernández Arguedas on 26/5/22.
//

import SwiftUI

///
///
///
struct MainView: View {
    
    @ObservedObject private var dataViewModel = DataViewModel()
    var performCloseAction: () -> ()
    
    ///
    ///
    ///
    init(performCloseAction: @escaping () -> ()) {
        self.performCloseAction = performCloseAction
        self.dataViewModel.getRepositories()
    }
    
    ///
    ///
    ///
    var body: some View {
        
        ///
        /// Validación de estado de pantalla.
        ///
        /// self.dataViewModel.error: si es cierto, muestra un mensaje de error y limpia los datos de usuario almacenados.
        /// self.dataViewModel.repositories.isEmpty: maneja el estado de cargando, muestra el loading en la pantalla.
        /// default: carga la lista de repositorios.
        ///
        if self.dataViewModel.error {
            VStack{
                Text(EMPTY_DATA)
            }.alert(ERROR_MESSAGE, isPresented: .constant(true)) {
                Button(OK) { self.performCloseAction() }
            }
        } else if self.dataViewModel.repositories.isEmpty {
            ProgressView()
        } else {
            List(self.dataViewModel.repositories) { repository in
                NavigationLink(destination: RepositoryDetailView(repository: repository)) {
                    RepositoryCell(repository: repository)
                        .frame(height: 120)
                }
            }
            .padding(.top, 10)
        }
    }
}

///
///
///
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(performCloseAction: {})
    }
}
