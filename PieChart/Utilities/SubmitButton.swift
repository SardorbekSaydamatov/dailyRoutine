//
//  SubmitButton.swift
//  PieChart
//
//  Created by Sardorbek Saydamatov on 10/09/24.
//

import Foundation
import SwiftUI

struct SubmitButton: View {
    @State var title: String = "Submit"
    var onClick: () -> Void
    var body: some View {
        Button(action: {
            onClick()
        }, label: {
            Text(title)
        })
        .frame(maxWidth: .infinity)
        .frame(height: 48)
        .foregroundStyle(Color.white)
        .background(Color.mint)
        .cornerRadius(10)
    }
}
