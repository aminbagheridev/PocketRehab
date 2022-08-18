//
//  PainMapInfoView.swift
//  PocketRehab
//
//  Created by Amin  Bagheri  on 2022-07-17.
//

import SwiftUI



struct ModifiedPainMapInfoView: View {
   
    var body: some View {
       
            ZStack {
                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                    .frame(width: 300, height: 500)
                    .shadow(color: .gray, radius: 20)
                    .foregroundColor(Color("b"))
                Image("PocketRehabTransparentLogo")
                    .frame(width: 6.0)
                    .opacity(0.2)
                
                
                VStack {
                    HStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 5, height: 5)
                            .padding(.trailing, 230)
                        
                        
                    }
                    
                    HStack {
                        Text("How to use Pain Map.")
                            .font(.system(size: 45, weight: .bold, design: .default))
                            .frame(alignment: .leading)
                            .shadow(radius: 1)
                            .padding(.bottom, -20)
                        
                    }
                    Text("""
    To use the pain map, tap anywhere you may be experiencing pain to highlight it.
    
    Then, retap the area to find out about the probable causes of your pain, as well as the exersises and stretches that will help!
    """)
                    .frame(width: 250, height: 350, alignment: .center)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 22, weight: .medium, design: .default))
                    .padding(.bottom, -20)
                    
                    
                    
                }
                
                
                
            }
            
        
        
        
        
    }
}


struct ModifiedPainMapInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ModifiedPainMapInfoView()
            .previewLayout(.sizeThatFits)
        
    }
}
