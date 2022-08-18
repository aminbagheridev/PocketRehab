//
//  CompletedPopupView.swift
//  PocketRehab
//
//  Created by Amin  Bagheri  on 2022-07-28.
//

import SwiftUI

struct CompletedPopupView: View {
    @State var numberOfSessions: Int
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: UIScreen.main.bounds.width * 1, height: UIScreen.main.bounds.height * 1)
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.5), radius: 30, x: 0, y: 0)
                .edgesIgnoringSafeArea(.all)
            Image("PocketRehabTransparentLogo")
                .resizable()
                .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.width * 0.9)
                .opacity(0.1)
            VStack {
                Text("Congrats! 🥳")
                    .font(.system(size: 45, weight: .bold, design: .default))
                    .bold()
                    .shadow(color: .gray, radius: 20, x: 0, y: 0)
                    .padding()
                    
                if numberOfSessions == 1 {
                    Text("You've completed your first session!")
                        
                        .font(.system(size: 29, weight: .medium, design: .default))
                        .multilineTextAlignment(.center)
                } else {
                    Text("You've completed \(numberOfSessions) sessions!")
                        .font(.system(size: 29, weight: .medium, design: .default))
                        .multilineTextAlignment(.center)
                }
                
                HStack {
                    Button {
                        
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 150, height: 60)
                                .foregroundColor(.red)
                                .shadow(radius: 10)
                            Text("Go back...")
                                .foregroundColor(.white)
                                .frame(width: 150, height: 50)
                                .font(.system(size: 20, weight: .bold))
                                .shadow(radius: 20)


                        }
                    }.padding(.horizontal)
                    Button {
                        
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 150, height: 60)
                                .foregroundColor(.green)
                                .shadow(radius: 10)
                            Text("Great!")
                                .foregroundColor(.white)
                                .frame(width: 150, height: 50)
                                .font(.system(size: 20, weight: .bold))
                                .shadow(radius: 20)


                        }
                    }.padding(.horizontal)

                }.padding(.top, 20)
                

            }
            
        }
        .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.width * 0.9)
    }
}

struct CompletedPopupView_Previews: PreviewProvider {
    static var previews: some View {
        CompletedPopupView(numberOfSessions: 1)
    }
}
