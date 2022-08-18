//
//  WidgetView.swift
//  PocketRehab
//
//  Created by Amin  Bagheri  on 2022-07-16.
//

import SwiftUI

struct WidgetView: View, Identifiable {
    var id: UUID
    @State var image: Image
    @State var title: String
    var body: some View {
        ZStack {
            image
                .resizable()
                .frame(width: 350, height: 200)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)
                .shadow(radius: 5)
            Text(title)
                .bold()
                .font(.title)
                .foregroundColor(.white)
                .shadow(color: .black, radius: 10)
                .shadow(color: .black, radius: 20)
                
        }
        .padding(.bottom, 15)
    }
}

struct WidgetView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView(id: UUID(), image: Image("placeholder"), title: "Morning Mobility")
    }
}
