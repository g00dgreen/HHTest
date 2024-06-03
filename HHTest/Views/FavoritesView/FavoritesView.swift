//
//  FavoritesView.swift
//  HHTest
//
//  Created by Артем Макар on 3.06.24.
//

import SwiftUI

struct FavoritesView: View {
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Избранное")
                        .font(.appFont(.title1))
                        .foregroundStyle(.white)
                    Text("\(viewModel.favouritesCount) вакансий")
                        .font(.appFont(.text1))
                        .foregroundStyle(.appGrey3)
                        .padding(.vertical, 24)
                }
                ScrollView {
                    VStack(spacing: 8) {
                        if let vacancies = viewModel.vacancies?.vacancies.filter({$0.isFavorite == true}) {
                                ForEach(vacancies) { vacancy in
                                    VacancyBannerView(vacancy: vacancy)
                                        .padding(16)
                                        .background(.appGrey2, in: RoundedRectangle(cornerRadius: 8))
                                        .onTapGesture {
                                            coordinator.push(.vacancy(vacancyData: vacancy))
                                        }
                                }
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
            Spacer()
        }
    }
    
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject private var viewModel: ViewModel
}

#Preview {
    FavoritesView()
}
