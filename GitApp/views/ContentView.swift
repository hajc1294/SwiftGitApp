//
//  ContentView.swift
//  GitApp
//
//  Created by Jean Carlo Hernández Arguedas on 26/5/22.
//

import SwiftUI

///
///
///
struct ContentView: View {
    
    @ObservedObject private var userViewModel = UserviewModel()
    @State private var user: String = Defaults.getUser()
    @State private var token: String = ""
    @State private var showInfo: Bool = false
    @State private var userError: Bool = false
    @State private var tokenError: Bool = false
    
    var body: some View {
        
        ///
        /// Valida la sesión del usuario.
        /// self.userViewModel.auth contiene el valor retornado por autenticación inicial: USER/TOKEN o por autenticación biométrica FaceID
        ///
        if self.userViewModel.auth {
            NavigationView {
                VStack {
                    MainView(performCloseAction: self.clearSession)
                        .background(.white)
                        .navigationTitle(WELCOME)
                        .toolbar {
                        HStack {
                            Button(action: { self.showInfo = true }) {
                                Image(systemName: "info.circle")
                                    .foregroundColor(.black)
                                    .font(.system(size: 20))
                            }
                            Button(action: { self.userViewModel.auth = false }) {
                                Image(systemName: "rectangle.portrait.and.arrow.right")
                                    .foregroundColor(.black)
                                    .font(.system(size: 20))
                            }
                        }
                    }
                    
                    ///
                    /// Ejecuta la navegación a la pantalla de información de usuario cuando se clickea sobre la oción de información en el toolbar.
                    ///
                    NavigationLink(destination: UserView(performCloseAction: clearSession), isActive: $showInfo) {
                        EmptyView()
                    }
                }
            }
            .accentColor(Color.red_git)
        } else {
            LoginView
        }
    }
    
    ///
    ///
    ///
    var LoginView: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Spacer()
                    Image(uiImage: UIImage(named: "git_logo")!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    Spacer()
                        .frame(height: 30)
                    TextField("", text: $user)
                        .placeholder(when: self.user.isEmpty) {
                            Text(USER).foregroundColor(self.userError ? .red : Color.hint)
                        }
                        .disabled(!Defaults.getUser().isEmpty)
                        .padding(10)
                        .background(!Defaults.getUser().isEmpty ? Color.disable_input : .white)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(self.userError ? .red : .black, style: StrokeStyle(lineWidth: 1)))
                        .accentColor(.black)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .onChange(of: user) { _ in self.userError = false }
                    if (self.userError) {
                        HStack {
                            Text(INPUT_ERROR)
                                .foregroundColor(.red)
                                .font(.system(size: 12))
                                .padding([.leading, .trailing], 5)
                            Spacer()
                        }
                    }
                    
                    
                    ///
                    /// Si existe sesión, solamente muestra el formulario con el ingreso por Face ID.
                    /// El input de ingreso de usuario queda deshabilitado, porque la sesión existe.
                    ///
                    /// En caso contrario, le solicita al usuario que ingrese el usuario y el token de Github.
                    ///
                    if Defaults.isUserToken() {
                        VStack {
                            Spacer()
                                .frame(height: 20)
                            Text(AUTH_WITH_FACE_ID)
                                .font(.subheadline)
                                .bold()
                            Spacer().frame(height: 15)
                            Button(action: { self.userViewModel.authenticateWithFaceID() }) {
                                Image(systemName: "faceid")
                                    .foregroundColor(.black)
                                    .font(.system(size: 60))
                            }
                        }
                        Image(uiImage: UIImage(named: "code_background")!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width)
                    } else {
                        VStack {
                            TextField("", text: $token)
                                .placeholder(when: self.token.isEmpty) {
                                    Text(TOKEN).foregroundColor(self.tokenError ? .red : Color.hint)
                                }
                                .padding(10)
                                .overlay(RoundedRectangle(cornerRadius: 10)
                                    .strokeBorder(self.userError ? .red : .black, style: StrokeStyle(lineWidth: 1)))
                                .accentColor(.black)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                                .onChange(of: token) { _ in self.tokenError = false }
                            if (self.tokenError) {
                                HStack {
                                    Text(INPUT_ERROR)
                                        .foregroundColor(.red)
                                        .font(.system(size: 12))
                                        .padding([.leading, .trailing], 5)
                                    Spacer()
                                }
                            }
                            Button(action: { self.authWithToken() }) {
                                Text(LOGIN)
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 30, maxHeight: 30, alignment: .center)
                                    .padding(8)
                                    .background(.black)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            Spacer()
                                .frame(height: 30)
                            Text(TOKEN_INFO)
                                .foregroundColor(.gray)
                                .font(.system(size: 12))
                        }
                        Spacer()
                    }
                }
                .padding(.leading, 50)
                .padding(.trailing, 50)
                .frame(width: geometry.size.width)
                .frame(minHeight: geometry.size.height)
            }
        }
        .background(.white)
    }
    
    private func authWithToken() {
        if (!self.user.isEmpty && !self.token.isEmpty) {
            self.userViewModel.saveSession(user: self.user, token: self.token)
        } else {
            self.userError = self.user.isEmpty
            self.tokenError = self.token.isEmpty
        }
        
    }
    
    ///
    ///
    ///
    private func clearSession() {
        Defaults.clear()
        self.user = ""
        self.token = ""
        self.showInfo = false
        self.userViewModel.auth = false
    }
}

///
///
///
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
