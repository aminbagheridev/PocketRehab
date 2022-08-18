//
//  RoutineView.swift
//  PocketRehab
//
//  Created by Amin  Bagheri  on 2022-07-18.
//

import SwiftUI

struct CustomRoutineView: View, Hashable {
    let isAddDefault: Bool
    let color: Color?
    let text: String?
    var body: some View {
        
        ZStack  {
            
            if color != nil && text != nil && isAddDefault == false {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 275, height: 175)
                    
                    .overlay(
                        LinearGradient(colors: [color!.opacity(1), color!.opacity(0.8)], startPoint: .top, endPoint: .bottom)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 5)
                Text(text!)
                    .foregroundColor(.white)
                    .shadow(radius: 5)
                    .font(.system(size: 30, weight: .bold, design: .default))
                    .frame(minWidth: 50, idealWidth: 200, maxWidth: 250, minHeight: 50, idealHeight: 135, maxHeight: 175, alignment: .center)
                    .multilineTextAlignment(.center)
                    
            } else if isAddDefault == true {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 275, height: 175)
                    .shadow(radius: 5)
                    .overlay(
                        LinearGradient(colors: [.white.opacity(0.3), .white.opacity(0.1)], startPoint: .top, endPoint: .bottom)
                    )
                Image(systemName: "plus")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 80, height: 80)
            }
            
            
            
        }
        
    }
}

struct CustomRoutineView_Previews: PreviewProvider {
    static var previews: some View {
        CustomRoutineView(isAddDefault: false, color: .yellow, text: "A morning mobility routine to do on sundays")
    }
}
