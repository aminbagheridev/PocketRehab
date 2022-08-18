//
//  PainMapInfoView.swift
//  PocketRehab
//
//  Created by Amin  Bagheri  on 2022-07-17.
//

import SwiftUI



struct PainMapInfoView: View {
    @State var xButtonPressed = false
    var body: some View {
        if xButtonPressed == false {
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
                        Button {
                            xButtonPressed = true
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color("m"))
                            
                        }
                        
                        
                    }
                    
                    HStack {
                        Text("Welcome!")
                            .font(.system(size: 45, weight: .bold, design: .default))
                            .frame(alignment: .leading)
                            .shadow(radius: 1)
                            .padding(.bottom, -20)
                        
                    }
                    Text("""
    To use the pain map, tap anywhere you may be experiencing pain to highlight it.
    
    Then, retap the area to learn more about your pain, as well as the exercises that will help!
    """)
                    .frame(width: 250, height: 350, alignment: .center)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 22, weight: .medium, design: .default))
                    .padding(.bottom, -20)
                    HStack {
                        Image(systemName: "checkmark.square")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.init(red: 0.2, green: 0, blue: 1))
                        Text("Do not show again...")
                            .foregroundColor(.init(red: 0.2, green: 0, blue: 1))
                            
                        
                    }
                    .gesture(
                        TapGesture()
                            .onEnded { _ in
                                
                                UserDefaults.standard.set(true, forKey: "doNotShowInfo")
                                xButtonPressed = true
                            }
                            
                    )
                    
                    
                    
                }
                
                
                
            }
            
        } else if xButtonPressed == true {
            Rectangle()
                .opacity(0)
            
        }
        
        
        
    }
}


struct PainMapInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PainMapInfoView()
        
    }
}
