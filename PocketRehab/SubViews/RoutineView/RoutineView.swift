//
//  RoutineView.swift
//  PocketRehab
//
//  Created by Amin  Bagheri  on 2022-07-18.
//

import SwiftUI

struct RoutineView: View, Hashable {
    static func == (lhs: RoutineView, rhs: RoutineView) -> Bool {
        return lhs.image == rhs.image
    }
    
    func hash(into hasher: inout Hasher) {
        
    }
    
    let image: Image
    let text: String
    var body: some View {
        
        ZStack  {
            image
                .resizable()
                .frame(width: 275, height: 175)
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 5)
            
            
            Text(text)
                .foregroundColor(.white)
                .shadow(color: .black, radius: 5)
                .font(.system(size: 35, weight: .bold, design: .default))
                .frame(minWidth: 50, idealWidth: 200, maxWidth: 250, minHeight: 50, idealHeight: 135, maxHeight: 175, alignment: .center)
                .multilineTextAlignment(.center)
        }
    }
}

struct RoutineView_Previews: PreviewProvider {
    static var previews: some View {
        RoutineView(image: Image("placeholder2") ,text: "Golfers Routine")
    }
}
