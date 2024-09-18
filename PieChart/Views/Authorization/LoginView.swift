//
//  LoginView.swift
//  PieChart
//
//  Created by Sardorbek Saydamatov on 10/09/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @State private var showregister: Bool = false
    @State private var showAlert: Bool = false
    var body: some View {
        VStack(alignment: .leading) {
            Text("Username")
            YTextField(text: $viewModel.username, placeholder: "Username")
            Text("Email")
            YTextField(text: $viewModel.email, placeholder: "Email")
                .padding(.bottom, 20)
            Text("Password")
            YSecureField(text: $viewModel.password, placeholder: "Password")
            
            Button(action: {
                showregister = true
            }, label: {
                Text("Create a new account?")
            })
            .padding(.top)
            
            Spacer()
            
            SubmitButton(title: "Submit") {
                viewModel.login()
                if viewModel.loginSuccess == false {
                    showAlert = true
                }
            }
            
        }
        .navigationDestination(isPresented: $showregister, destination: {
            SignupView()
        })
        .navigationDestination(isPresented: $viewModel.loginSuccess, destination: {
            ContentView()
        })
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Login Error"),
                message: Text(viewModel.loginError ?? "Unknown error"),
                dismissButton: .default(Text("OK"))
            )
        }
        .padding()
        .navigationTitle("Login")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    NavigationStack {
        LoginView()
    }
}
