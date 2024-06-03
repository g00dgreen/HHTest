//
//  JobSearchView.swift
//  HHTest
//
//  Created by Артем Макар on 30.05.24.
//

import SwiftUI

struct JobSearchView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text("Поиск сотрудников")
                .font(.appFont(.title3))
                .padding(.bottom, 8)
            Text("Размещение вакансий и доступ к базе резюме")
                .font(.appFont(.text1))
                .padding(.bottom, 16)
            MainButton(
                text: "Я ищу сотрудников",
                font: .buttonText1,
                isCircleButton: true,
                action: {}
            )
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 24)
        .foregroundStyle(.white)
        .background(.appGrey1)
        .cornerRadius(8)
    }
}

#Preview {
    JobSearchView()
}
