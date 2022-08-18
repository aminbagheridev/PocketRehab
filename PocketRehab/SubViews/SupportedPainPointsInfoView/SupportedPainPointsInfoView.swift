//
//  SupportedPainPointsInfoView.swift
//  PocketRehab
//
//  Created by Amin  Bagheri  on 2022-07-17.
//

import SwiftUI

struct SupportedPainPointsInfoView: View {
    var body: some View {
       
            ZStack {
                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                    .frame(width: 300, height: 650)
                    .shadow(color: .gray, radius: 20)
                    .foregroundColor(Color("b"))

                Image("bodyMap")
                    .aspectRatio(contentMode: .fit)
                    .opacity(0.2)
                    .frame(width: 300, height: 350, alignment: .center)
                    .padding(.top, 300)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                VStack {
                    HStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 5, height: 5)
                            .padding(.trailing, 230)
                        
                        
                    }
                    
                    HStack {
                        Text("Supported pain points:")
                            .font(.system(size: 45, weight: .bold, design: .default))
                            .frame(alignment: .leading)
                            .shadow(radius: 1)
                            .padding(.bottom, -20)
                            .padding(.top, -40)
                        
                    }
                    .padding(.bottom, 30)
                    
                        
                        Text("""
    Pocket Rehab wants to help as many people solve their physical pain as possible. As of now, we help solve:
    """)
                        .frame(width: 250, height: 150, alignment: .center)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 22, weight: .medium, design: .default))
                        
                        Text("""
        👉 Neck pain
        👉 Shoulder pain
        👉 Elbow pain
        👉 Wrist pain
        👉 Knee pain
        👉 Lower back pain
        👉 Ankle pain
    """)
                        .frame(width: 250, height: 290, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 22, weight: .medium, design: .default))
                        .padding(.bottom, -20)

                    }
                    
                    
                    
                
                
                
                
            }
            
        
        
        
        
    }
}

struct SupportedPainPointsInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SupportedPainPointsInfoView()
    }
}
