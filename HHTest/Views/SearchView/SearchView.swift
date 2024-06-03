//
//  SearchView.swift
//  HHTest
//
//  Created by Артем Макар on 1.06.24.
//

import SwiftUI

struct SearchView: View {
    
    var body: some View {
        switch viewModel.viewModelLoadState {
        case .loaded(_):
            VStack(alignment: .leading) {
                HStack(spacing: 8) {
                    CustomTextField(text: .constant(""), isValid: .constant(true), prompt: "Должность, ключевые слова", imageName: "search")
                    Image("filter")
                        .frame(width: 40, height: 40)
                        .background(.appGrey2, in: RoundedRectangle(cornerRadius: 8))
                }
                Spacer()
                ScrollView {
                    ScrollView(.horizontal) {
                        HStack {
                            if let vacancies = viewModel.vacancies?.offers  {
                                ForEach(vacancies) { offer in
                                    BannerView(bannerId: offer.id ?? "", text: offer.title, buttonTitle: offer.button?.text)
                                }
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                    VStack(alignment: .leading) {
                        Text("Вакансии для вас")
                            .font(.appFont(.title2))
                            .foregroundStyle(.white)
                            .padding(.top, 16)
                        if let vacancies = viewModel.vacancies?.vacancies  {
                            if vacancies.count >= viewModel.countOfVacancyBanners {
                                ForEach(vacancies[0..<viewModel.countOfVacancyBanners]) { vacancy in
                                    VacancyBannerView(vacancy: vacancy)
                                        .padding(16)
                                        .background(.appGrey2, in: RoundedRectangle(cornerRadius: 8))
                                        .onTapGesture {
                                            coordinator.push(.vacancy(vacancyData: vacancy))
                                        }
                                }
                            }
                            MainButton(
                                text: "Показать еще \(vacancies.count - viewModel.countOfVacancyBanners) вакансии",
                                font: .buttonText2,
                                backgroundColor: .appBlue,
                                isCircleButton: false,
                                frameHeight: 48,
                                action: {}
                            )
                            .padding(.bottom, 8)
                        }
                    }
                }
                .padding(.bottom, 6)
                .scrollIndicators(.hidden)
                .cornerRadius(8)
            }
            .toolbar(.hidden, for: .navigationBar)
        case .loading:
            VStack(alignment: .center) {
                Spacer()
                ProgressView()
                Spacer()
            }
        case .failed(let error):
            Text("Some error: \(error)")
                .foregroundStyle(.white)
        }
    }
    
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject private var viewModel: ViewModel
}
