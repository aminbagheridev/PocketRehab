//
//  PocketRehabApp.swift
//  PocketRehab
//
//  Created by Amin  Bagheri  on 2022-07-16.
//

import SwiftUI
import FirebaseCore

enum CurrView: Int {
    case login
    case register
    case home
    case painMap
    case routines
    case courses
    case settings
}

// our observable object class
class ViewRouter: ObservableObject {
    @Published var currView = CurrView.login
}

// a view that creates the ViewRouter class, and places it into the enviroment gloablly.
@main
struct PocketRehabApp: App {
    @StateObject private var VM = LoginRegisterViewModel()
    @AppStorage("timesInitializedHome") var timesInitializedHome: Int?
    private var viewRouter = ViewRouter()
    
    init() {
        FirebaseApp.configure()
        timesInitializedHome = 0
        if VM.userSignedIn() {
            viewRouter.currView = .home
        } else {
            viewRouter.currView = .login
        }
    }
    
    var body: some Scene {
        WindowGroup {
//            CourseLiquidSwipeView(course: .backPain)
            MainView()
                .environmentObject(viewRouter)
        }
    }
}
