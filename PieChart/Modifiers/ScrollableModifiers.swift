//
//  ScrollableModifiers.swift
//  PieChart
//
//  Created by Sardorbek Saydamatov on 10/09/24.
//

import Foundation
import SwiftUI

struct ScrollableModifier: ViewModifier {
    var axis: Axis.Set
    var indicators: Bool
    
    func body(content: Content) -> some View {
        ScrollView(axis, showsIndicators: indicators) {
            content
        }
    }
}
