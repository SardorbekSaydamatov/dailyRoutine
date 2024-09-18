//
//  SignupView.swift
//  PieChart
//
//  Created by Sardorbek Saydamatov on 10/09/24.
//

import SwiftUI

struct SignupView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isRegistered: Bool = false
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(alignment: .leading) {
            Text("Username")
            YTextField(text: $username, placeholder: "Username")
                .padding(.bottom, 20)
            Text("Email")
            YTextField(text: $email, placeholder: "Email")
                .padding(.bottom, 20)
            Text("Password")
            YSecureField(text: $password, placeholder: "Password")
            
            Button(action: {
                dismiss()
            }, label: {
                Text("Already have an account?")
            })
            .padding(.top)
            
            Spacer()
            
            SubmitButton(title: "Submit") {
                isRegistered = true
            }
        }
        .navigationDestination(isPresented: $isRegistered, destination: {
            ContentView()
        })
        .navigationTitle("Sign up")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    NavigationStack {
        SignupView()
    }
}
