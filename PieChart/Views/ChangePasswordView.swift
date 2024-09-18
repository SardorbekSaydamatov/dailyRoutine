//
//  ChanPasswordView.swift
//  PieChart
//
//  Created by Sardorbek Saydamatov on 12/09/24.
//

import SwiftUI

struct ChangePasswordView: View {
    @State private var oldPassword: String = ""
    @State private var newPassword: String = ""
    @State private var confirmPassword: String = ""
    var body: some View {
        VStack {
            YSecureField(text: $oldPassword, placeholder: "Old password")
            YSecureField(text: $newPassword, placeholder: "New password")
            YSecureField(text: $confirmPassword, placeholder: "Confirm new passowrd")
            
            Spacer()
            
            SubmitButton(title: "Submit") {
                
            }
        }
        .navigationTitle("Change password")
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
    }
}

#Preview {
    NavigationStack {
        ChangePasswordView()
    }
}
