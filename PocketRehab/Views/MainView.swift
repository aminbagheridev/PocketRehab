//
//  MainView.swift
//  PocketRehab
//
//  Created by Amin  Bagheri  on 2022-07-16.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {

        switch viewRouter.currView {
            
        case .login:
            LoginView()
                .environmentObject(viewRouter)
            
        case .home:
            HomeView(widgets: [WidgetView(id: UUID(), image: Image("placeholder"), title: "Morning Mobility")]
            )
            .environmentObject(viewRouter)

            
        case .painMap:
            PainMapView(imageHeight: 1, imageWidth: 1, tappedX: 1, tappedY: 1)
                .environmentObject(viewRouter)

            
        case .routines:
            RoutinesView()
                .environmentObject(viewRouter)

        case .courses:
            CoursesView()
                .environmentObject(viewRouter)

        case .settings:
            SettingsView()
                .environmentObject(viewRouter)
        case .register:
            RegisterView()
                .environmentObject(viewRouter)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
        
    }
}
