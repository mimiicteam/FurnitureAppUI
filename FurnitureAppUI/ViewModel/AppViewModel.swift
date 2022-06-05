//
//  AppViewModel.swift
//  FurnitureAppUI
//
//  Created by NGUYEN MINH DUC on 04/06/2022.
//

import SwiftUI

class AppViewModel: ObservableObject {
    //MARK: - Properties
    @Published var currentTab: Tab = .home
    //MARK: - Home Properties
    @Published var currentMenu: String = "All"
    //MARK: - Detail View Properties
    @Published var showDetailView: Bool = false
    @Published var currentActiveItem: Furniture?
}
