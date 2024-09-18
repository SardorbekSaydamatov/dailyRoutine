//
//  ProfileView.swift
//  PieChart
//
//  Created by Sardorbek Saydamatov on 10/09/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var showEdit: Bool = false
    @State private var showChangePassword: Bool = false
    @State private var logoutTapped: Bool = false
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Sardorbek")
                    .font(.system(size: 30, weight: .semibold))
                    .padding(.bottom, 40)
            
                Button(action: {
                    showEdit = true
                }, label: {
                        Text("Edit profile")
                            .font(.system(size: 18, weight: .medium))
                    
                        Spacer()
                    
                        Image(systemName: "chevron.right")
                            .padding(.trailing, 30)
                })
                
                Button(action: {
                    showChangePassword = true
                }, label: {
                        Text("Change paswword")
                            .font(.system(size: 18, weight: .medium))
                    
                        Spacer()
                    
                        Image(systemName: "chevron.right")
                            .padding(.trailing, 30)
                })
                
                Spacer()
                
                Button(action: {
                    logoutTapped = true
                }, label: {
                    Text("Log out")
                        .font(.system(size: 18, weight: .medium))
                })
                
//                Button(action: {
//                    
//                }, label: {
//                    Text("Delete account")
//                        .font(.system(size: 18, weight: .medium))
//                        .foregroundStyle(Color.red)
//                })
                
               // Spacer()
            }
            .foregroundStyle(.primary)
            .padding(.leading)
            
            Spacer()
        }
        .navigationDestination(isPresented: $showEdit) {
            EditProfileView()
        }
        .navigationDestination(isPresented: $showChangePassword) {
            ChangePasswordView()
        }
        .navigationDestination(isPresented: $logoutTapped) {
            LoginView()
        }
    }
}

#Preview {
    ProfileView()
}
