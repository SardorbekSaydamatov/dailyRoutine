//
//  LoginView.swift
//  PieChart
//
//  Created by Sardorbek Saydamatov on 10/09/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginService()
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showregister: Bool = false
    @State private var showAlert: Bool = false
    @State private var isLogged: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Username")
            YTextField(text: $username, placeholder: "Username")
            Text("Email")
            YTextField(text: $email, placeholder: "Email")
                .padding(.bottom, 20)
            Text("Password")
            YSecureField(text: $password, placeholder: "Password")
            
            Button(action: {
                showregister = true
            }, label: {
                Text("Create a new account?")
            })
            .padding(.top)
            
            Spacer()
            
            SubmitButton(title: "Submit") {
                login(username: username, email: email, password: password)
            }
            
        }
        .navigationDestination(isPresented: $isLogged, destination: {
            MainView()
        })
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Login Error"),
                message: Text("Unknown error"),
                dismissButton: .default(Text("OK"))
            )
        }
        .padding()
        .navigationTitle("Login")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
    }
    
    func login(username: String, email: String, password: String) {
        viewModel.login(username: username, email: email, password: password) { result in
            if viewModel.token != "" {
                isLogged = true
            }
        }
    }
}

#Preview {
    NavigationStack {
        LoginView()
    }
}
