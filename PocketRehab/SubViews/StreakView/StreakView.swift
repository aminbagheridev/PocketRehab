//
//  EmptyStreakView.swift
//  PocketRehab
//
//  Created by Amin  Bagheri  on 2022-07-16.
//

import SwiftUI

struct StreakView: View {
    @State var dayLabel: String
    @State var didLogIn: Bool
    var body: some View {
        if didLogIn {
            ZStack {
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.blue)
                Text(dayLabel)
                    .font(.system(size: 12, weight: .bold, design: .default))
                    .padding(.top, 4)
                    .foregroundColor(.white)
                    
            }
        } else {
            ZStack {
                Image(systemName: "star")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.blue)
                Text(dayLabel)
                    .font(.system(size: 12, weight: .bold, design: .rounded))
                    
                    .padding(.top, 4)
                    .foregroundColor(.blue)
                    
            }
        }
        
        
        
    }
}

struct StreakView_Previews: PreviewProvider {
    static var previews: some View {
        StreakView(dayLabel: "S", didLogIn: false)
            .previewLayout(.sizeThatFits)
    }
}
