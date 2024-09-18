//
//  ActivitiesModel.swift
//  PieChart
//
//  Created by Sardorbek Saydamatov on 10/09/24.
//

import Foundation


struct ActivitiesModel: Identifiable {
    let id = UUID()
    let title: String
    let start: String
    let stop: String
    let duration: Double
    let color: String
}
