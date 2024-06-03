//
//  VacancyView.swift
//  HHTest
//
//  Created by Артем Макар on 2.06.24.
//

import SwiftUI

struct VacancyView: View {
    
    let vacancy: Vacancy
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ScrollView {
                VStack(alignment: .leading) {
                    mainInfo
                        .padding(.bottom, 26)
                    HStack(spacing: 8, content: {
                        ApplicantsBannerView(image: Image("profile"), type: .applied, count: vacancy.appliedNumber)
                        if vacancy.lookingNumber != nil {
                            ApplicantsBannerView(image: Image("eye"), type: .looking, count: vacancy.lookingNumber)
                        }
                    })
                    .padding(.bottom, 19)
                    MapView(title: vacancy.company, addres: makeAddres())
                        .padding(.bottom, 16)
                    aboutVacancy
                        .padding(.bottom, 28)
                    questionsText
                        .padding(.bottom, 16)
                    questionsView
                    
                }
            }
            .scrollIndicators(.hidden)
            MainButton(text: "Откликнуться", font: .buttonText1, backgroundColor: .appGreen, isCircleButton: false, frameHeight: 48) {
            }
            .padding(.bottom, 24)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.black, for: .navigationBar)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {
                } label: {
                    Image("eye")
                        .resizable()
                        .frame( width: 24, height: 24 )
                }
            }
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {
                } label: {
                    Image("share")
                        .resizable()
                        .frame( width: 24, height: 24 )
                }
            }
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {
                    viewModel.chengeVacancyStatus(vacancy: vacancy)
                } label: {
                    Image(isFavorite ? "favoritesFill" : "favorites")
                        .resizable()
                        .foregroundColor(.white)
                        .frame( width: 24, height: 24 )
                }
            }
            ToolbarItemGroup(placement: .navigationBarLeading) {
                Button {
                    coordinator.pop()
                } label: {
                    Image("back")
                        .resizable()
                        .frame( width: 24, height: 24 )
                }
            }
        }
    }
    
    @ViewBuilder var mainInfo: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(vacancy.title)
                .font(.appFont(.title1))
            Text(vacancy.salary.full )
                .font(.appFont(.text1))
            VStack(alignment: .leading, spacing: 4) {
                Text("Tребуемый опыт: \(vacancy.experience.text)")
                    .font(.appFont(.text1))
                Text(vacancy.schedules.joined(separator: ", "))
                    .font(.appFont(.text1))
            }
        }
        .foregroundStyle(.white)
    }
    
    @ViewBuilder var aboutVacancy: some View {
        VStack(alignment: .leading, spacing: 16) {
            if let description = vacancy.description {
                Text(description)
                    .font(.appFont(.text1))
                    .foregroundStyle(.white)
            }
            Text("Ваши задачи")
                .font(.appFont(.title2))
                .foregroundStyle(.white)
            VStack(alignment: .leading, spacing: 8) {
                Text(vacancy.responsibilities)
                    .font(.appFont(.text1))
                    .foregroundStyle(.white)
            }
        }
    }
    
    @ViewBuilder var questionsText: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Задайте вопрос работодателю")
                .font(.appFont(.title4))
                .foregroundStyle(.white)
            Text("Он получит его с откликом на вакансию")
                .font(.appFont(.title4))
                .foregroundStyle(.appGrey3)
        }
    }
    
    @ViewBuilder var questionsView: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(0..<vacancy.questions.count, id: \.self) { index in
                Button {
                    
                } label: {
                    Text(vacancy.questions[index])
                        .font(.appFont(.title4))
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(.appGrey1, in: .capsule)
                        .foregroundStyle(.white)
                }
                .disabled(true)
            }
        }
    }
    
    
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject private var viewModel: ViewModel
    
    private var isFavorite: Bool {
        if let isFavorite = viewModel.vacancies?.vacancies.first(where: {$0.id == vacancy.id})?.isFavorite {
            return isFavorite
        } else {
            return false
        }
    }
    
    private func makeAddres() -> String {
        return [vacancy.address.town, vacancy.address.street, vacancy.address.house].joined(separator: ", ")
    }
    
}
