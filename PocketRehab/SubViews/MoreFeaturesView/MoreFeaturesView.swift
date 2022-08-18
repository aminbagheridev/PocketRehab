//
//  MoreFeaturesView.swift
//  PocketRehab
//
//  Created by Amin  Bagheri  on 2022-07-17.
//

import SwiftUI
import EmailComposer

struct MoreFeaturesView: View {
    @State private var showEmailComposer = false
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                .frame(width: 300, height: 600)
                .shadow(color: .gray, radius: 20)
                .foregroundColor(Color("b"))

            Image("developer")
                .aspectRatio(contentMode: .fit)
                .opacity(0.2)
                .frame(width: 300, height: 517, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.top, 83)
            
            
            
            VStack {
                HStack {
                    Text("""
                             Need more
                             stuff?
                             """)
                    .font(.system(size: 45, weight: .bold, design: .default))
                    .frame(alignment: .leading)
                    .shadow(radius: 1)
                    .padding(.trailing, 30)
                    
                    
                }
                .padding(.bottom, 10)
                
                
                Text("""
    If you need any more features that our team has forgotten to include,or you just need more support for different pain points in the body, please shoot the developer an email, and he'll add your feature ASAP!
    """)
                .frame(width: 250, height: 300, alignment: .center)
                .multilineTextAlignment(.leading)
                .font(.system(size: 22, weight: .medium, design: .default))
                VStack {
                    Text("Email at:")
                        .font(.system(size: 22, weight: .bold, design: .default))
                    Button {
                        print("Email button pressed")
                        showEmailComposer = true
                    } label: {
                        Text("contact@aminbagheri.com")
                            .foregroundColor(.blue)
                            .font(.system(size: 22, weight: .bold, design: .default))
                    }
                    .emailComposer(isPresented: $showEmailComposer)

                    
                }
            }
        }
    }
}
struct MoreFeaturesView_Previews: PreviewProvider {
    static var previews: some View {
        MoreFeaturesView()
    }
}
