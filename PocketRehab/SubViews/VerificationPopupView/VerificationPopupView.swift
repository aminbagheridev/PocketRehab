//
//  ContentView.swift
//  verificationPopupView
//
//  Created by Amin  Bagheri  on 2022-07-20.
//

import SwiftUI

struct VerificationPopupView: View {
    
    @Binding var showEmailVerificationPopup: Bool
    @Binding var doneVerificationButtonPressed: Bool
    @Binding var cancelVerificationButtonPressed: Bool

    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color("b"))
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .shadow(radius: 20)

            Image(systemName: "checkmark.seal.fill")
                .resizable()
                .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.width * 0.8)
                .foregroundColor(.green)
                .opacity(0.2)
            

            VStack {
                
                HStack {
                    Rectangle()
                        .frame(width: 1, height: 1, alignment: .center)
                        .foregroundColor(.clear)
                        .padding(.trailing, 300)
                    Button {
                        showEmailVerificationPopup = false
                        cancelVerificationButtonPressed.toggle()
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color("m"))
                            .padding()
                            .background(Color.clear)
                        
                    }
                    .padding(.top, UIScreen.main.bounds.height * 0.1)
                    .padding(.trailing, 20)
                    
                }
                
                Spacer()
                
                Text("Almost done!")
                    .font(.system(size: 50, weight: .bold, design: .default))
                    .shadow(radius: 20)

                    .padding(.bottom, 1)
                Text("A verification link has been sent to your inbox.")
                    .bold()
                    .padding(.bottom, 5)
                    .font(.system(size: 25, weight: .bold, design: .default))
                    .frame(width: UIScreen.main.bounds.width * 0.8)
                    .multilineTextAlignment(.center)
                Text(
"""
Click on the verification link in your inbox to finish signing up and start killing your pain!

(Check your spam and wait up to 5 minutes)
"""
                )
                .frame(width: UIScreen.main.bounds.width * 0.8)
                .font(.system(size: 20, weight: .semibold))
                .multilineTextAlignment(.center)
                
                Spacer()
                
                Button {
                    doneVerificationButtonPressed.toggle()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 300, height: 60)
                            .foregroundColor(.green)
                            .shadow(radius: 10)
                        Text("Double Click When Done!")
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .font(.system(size: 20, weight: .bold))
                            .shadow(radius: 20)

                    }
                    
                }
                .padding(.bottom, 30)

            }
        }
    }
}

struct VerificationPopupView_Previews: PreviewProvider {
    @State static var showEmailVerificationPopup: Bool = true
    @State static var doneVerificationButtonPressed: Bool = false
    @State static var cancelVerificationButtonPressed: Bool = false
    static var previews: some View {
        VerificationPopupView(showEmailVerificationPopup: $showEmailVerificationPopup, doneVerificationButtonPressed: $doneVerificationButtonPressed, cancelVerificationButtonPressed: $cancelVerificationButtonPressed)
    }
}
