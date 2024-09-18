//
//  SlideMenuView.swift
//  PieChart
//
//  Created by Sardorbek Saydamatov on 10/09/24.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isShowing: Bool
    @Binding var selectedTab: Int
    @State private var selectedOption: SideMenuOptionModel?
    var body: some View {
        ZStack {
            if isShowing {
                Rectangle()
                    .opacity(0.2)
                    .ignoresSafeArea()
                    .onTapGesture { isShowing.toggle() }
                
                HStack {
                    VStack(alignment: .leading, spacing: 32) {
                        VStack {
                            ForEach(SideMenuOptionModel.allCases) {option in
                                Button(action: {
                                    optionTapped(option: option)
                                }, label: {
                                    SideMenuRawValue(option: option, selectedOption: $selectedOption)
                                })
                            }
                        }
                        Spacer()
                    }
                    .padding()
                    .frame(width: 270, alignment: .leading)
                    .background(Color.init(.systemBackground))
                    
                    Spacer()
                }
                .transition(.move(edge: .leading))
            }
        }
        .animation(.easeInOut, value: isShowing)
    }
    
    private func optionTapped(option: SideMenuOptionModel) {
        selectedOption = option
        selectedTab = option.rawValue
        isShowing = false
    }
}

#Preview {
    SideMenuView(isShowing: .constant(true), selectedTab: .constant(0))
}
