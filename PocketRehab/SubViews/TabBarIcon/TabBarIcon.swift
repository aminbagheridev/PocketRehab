//
//  TabBarIcon.swift
//  PocketRehab
//
//  Created by Amin  Bagheri  on 2022-07-22.
//

import SwiftUI

struct TabBarIcon: View {
    let width, height: CGFloat
    let systemIconName, tabName: String
    @StateObject var viewRouter: ViewRouter
    let  currentView: CurrView
    
    var body: some View {
        VStack {
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
            Text(tabName)
                .font(.footnote)
            Spacer()
        }
        .padding(.horizontal, 4)
        .onTapGesture {
            viewRouter.currView = currentView
        }
        .foregroundColor(viewRouter.currView == currentView ? Color("TabBarHighlight") : .gray)
    }
}


