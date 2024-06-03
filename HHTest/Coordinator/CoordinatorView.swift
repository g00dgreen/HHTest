//
//  CoordinatorView.swift
//  HHTest
//
//  Created by Артем Макар on 1.06.24.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject var coordinator = Coordinator()
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            NavigationStack(path: $coordinator.path) {
                ZStack {
                    Color.black
                    coordinator.view(for: coordinator.activeTab)
                        .padding(.horizontal, 16)
                        .navigationDestination(for: Page.self) { page in
                            ZStack {
                                Color.black
                                coordinator.view(for: page)
                                    .padding(.horizontal, 16)
                            }
                            .background(.black)
                        }
                }
                .background(.black)
            }
            CustomTabBar()
               .background(.black)
        }
        .environmentObject(coordinator)
        .environmentObject(viewModel)
    }
}

#Preview {
    CoordinatorView()
}
