//
//  Color + Extensions.swift
//  PieChart
//
//  Created by Sardorbek Saydamatov on 10/09/24.
//

import Foundation
import SwiftUI

extension Color {
    static func from(name: String) -> Color {
        switch name.lowercased() {
        case "red":
            return .red
        case "blue":
            return .blue
        case "green":
            return .green
        case "yellow":
            return .yellow
        case "orange":
            return .orange
        case "purple":
            return .purple
        case "pink":
            return .pink
        case "black":
            return .black
        case "white":
            return .white
        case "gray":
            return .gray
        case "brown":
            return .brown
        case "cyan":
            return .cyan
        case "mint":
            return .mint
        case "indigo":
            return .indigo
        case "teal":
            return .teal
        default:
            return .gray // Default to gray if the color is not recognized
        }
    }
}
