//
//  SlideMenuOptionModel.swift
//  PieChart
//
//  Created by Sardorbek Saydamatov on 10/09/24.
//

import Foundation

enum SideMenuOptionModel: Int, CaseIterable {
    case mainView
    case editView
    case profile
    
    var title: String {
        switch self {
        case .mainView:
            return "Tasks"
        case .editView:
            return "Edit tasks"
        case .profile:
            return "Profile"
        }
    }
}

extension SideMenuOptionModel: Identifiable {
    var id: Int { return self.rawValue}
}
