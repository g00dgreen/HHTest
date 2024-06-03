//
//  CustomTabBarItem.swift
//  HHTest
//
//  Created by Артем Макар on 1.06.24.
//

import SwiftUI

struct CustomTabBarItem: View {
    
    private let tab: Page
    private let isActiveTab: Bool
    private let tapAction: () -> Void
    
    init(tab: Page, isActiveTab: Bool, tapAction: @escaping () -> Void) {
        self.tab = tab
        self.isActiveTab = isActiveTab
        self.tapAction = tapAction
    }
    
    var body: some View {
        Button {
            tapAction()
        } label: {
            VStack(alignment: .center) {
                Image(tab.id)
                    .resizable()
                    .frame(
                        width: 24,
                        height: 24
                    )
                Text(LocalizedStringKey(tab.id.localizedCapitalized))
                    .font(.appFont(.tabText))
            }
            
            .frame(height: 40)
        }
        .foregroundStyle(isActiveTab ? Color.accentColor : .appGrey3)
    }
}

#Preview {
    CustomTabBarItem(tab: .profile, isActiveTab: true, tapAction: {})
}
