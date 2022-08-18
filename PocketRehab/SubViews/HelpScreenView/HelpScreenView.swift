//
//  HelpScreenView.swift
//  PocketRehab
//
//  Created by Amin  Bagheri  on 2022-07-17.
//

import SwiftUI

struct HelpScreenView: View {
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack {
                    ModifiedPainMapInfoView()
                        .padding(.bottom, 20)
                    SupportedPainPointsInfoView()
                        .padding(.bottom, 20)
                    MoreFeaturesView()
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, max(proxy.safeAreaInsets.leading, proxy.safeAreaInsets.trailing))
            }
        }
        .edgesIgnoringSafeArea(.horizontal)
    }
        
    }


struct HelpScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HelpScreenView()
    }
}
