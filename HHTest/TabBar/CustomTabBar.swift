//
//  CustomTabBar.swift
//  HHTest
//
//  Created by Артем Макар on 1.06.24.
//

import SwiftUI

struct CustomTabBar: View {
    
    var body: some View {
        LazyVGrid(
            columns: .init(
                repeating: .init(
                    .flexible(minimum: .zero, maximum: .greatestFiniteMagnitude),
                    spacing: nil,
                    alignment: .center
                ),
                count: coordinator.tabs.count
            ),
            alignment: .center,
            spacing: 0
        ) {
            ForEach(coordinator.tabs) { tab in
                CustomTabBarItem(
                    tab: tab,
                    isActiveTab: coordinator.activeTab == tab
                ) {
                    if viewModel.isConfirmed {
                        coordinator.changeTab(to: tab)
                    }
                }
                .modifier(OverlayCounter(number: tab == .favorites ? viewModel.favouritesCount : 0))
            }
        }
    }
    
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject private var viewModel: ViewModel
}
