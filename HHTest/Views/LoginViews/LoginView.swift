//
//  LoginView.swift
//  HHTest
//
//  Created by Артем Макар on 30.05.24.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Вход в личный кабинет")
                .font(.appFont(.title1))
                .foregroundStyle(.white)
            Spacer()
            EmployeeSearchView()
            JobSearchView()
            Spacer()
        }
    }
}

#Preview {
    LoginView()
}
