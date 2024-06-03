//
//  ViewModel.swift
//  HHTest
//
//  Created by Артем Макар on 1.06.24.
//
enum ViewModelLoadState {
    case loaded(JobVacancy)
    case loading
    case failed(String)
}

import SwiftUI

@MainActor class ViewModel: ObservableObject {
    
    @Published var viewModelLoadState: ViewModelLoadState = .loading
    
    var vacancies: JobVacancy?
    var isConfirmed: Bool = false
    var countOfVacancyBanners = 3
    var apiService = APIService()
    
    func endUserAuthentication(with code: String) {
        activeTabs()
        getVacancies()
    }
    
    var favouritesCount: Int {
        guard let vacancies = vacancies?.vacancies else { return 0 }
        var number = 0
        vacancies.forEach { number += $0.isFavorite ? 1 : 0
        }
        return number
    }
    
    func chengeVacancyStatus(vacancy: Vacancy) {
        if let vacancies = vacancies {
            let vacancyID = vacancies.vacancies.firstIndex { value in
                vacancy.id == value.id
            }
            if let id = vacancyID {
                self.vacancies!.vacancies[id].isFavorite.toggle()
            }
            withAnimation{
                self.viewModelLoadState = .loaded(vacancies)
            }
        }
    }
    
    func getVacancies() {
        viewModelLoadState = .loading
        Task {
            do {
                let vacancies = try await self.apiService.getAllVacancies()
                self.viewModelLoadState = .loaded(vacancies)
                self.vacancies = vacancies
            } catch APIError.invalidURl {
                self.viewModelLoadState = .failed("invalidURl")
            } catch APIError.invalidResponse {
                self.viewModelLoadState = .failed("invalidResponse")
            } catch APIError.invalidData {
                self.viewModelLoadState = .failed("invalidData")
            } catch {
                self.viewModelLoadState = .failed("Unknown error")
            }
        }
    }
    
    private func activeTabs() {
        isConfirmed = true
    }
}
