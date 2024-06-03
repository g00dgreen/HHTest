//
//  Coordinator.swift
//  HHTest
//
//  Created by Артем Макар on 1.06.24.
//

import Foundation
import SwiftUI

enum Page {
    case login
    case codeLogin(email: String)
    case vacancy(vacancyData: Vacancy)
    case search
    case favorites
    case responses
    case messages
    case profile
    
}

class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var activeTab = Page.login
    
    var tabs: [Page] = [.search, .favorites, .responses, .messages, .profile]
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }

    func changeTab(to page: Page) {
        if (activeTab != page) {
            path.removeLast(path.count)
            activeTab = page
        }
    }
    
    @ViewBuilder func view(for page: Page) -> some View {
        VStack(alignment: .leading) {
            switch page {
            case .login:
                LoginView()
            case .codeLogin(let email):
                CodeLoginView(email: email)
            case .search:
                SearchView()
                    .toolbar(.hidden, for: .navigationBar)
            case .vacancy(let vacancy):
                VacancyView(vacancy: vacancy)
            case .favorites:
                FavoritesView()
                    .toolbar(.hidden, for: .navigationBar)
            case .responses:
                VStack {
                    Text("Тут ничего нет")
                        .toolbar(.hidden, for: .navigationBar)
                }
            case .messages:
                VStack {
                    Text("Тут пусто")
                        .toolbar(.hidden, for: .navigationBar)
                }
            case .profile:
                VStack {
                    Text("Тут никого")
                        .toolbar(.hidden, for: .navigationBar)
                }
            }
        }
        .foregroundStyle(.white)
    }
}

extension Page: Hashable, Identifiable {
    
    static func == (lhs: Page, rhs: Page) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var id: String {
        switch self {
        case .login:
            return "login"
        case .codeLogin:
            return "codeLogin"
        case .search:
            return "search"
        case .vacancy(let vacancy):
            return vacancy.id
        case .favorites:
            return "favorites"
        case .responses:
            return "letter"
        case .messages:
            return "message"
        case .profile:
            return "profile"
        }
    }
}
