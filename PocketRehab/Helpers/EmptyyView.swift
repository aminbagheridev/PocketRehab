//
//  EmptyyView.swift
//  PocketRehab
//
//  Created by Amin  Bagheri  on 2022-08-03.
//

import SwiftUI

struct EmptyyView: View {
    var body: some View {
        Rectangle()
            .frame(width: 0)
            .accessibilityHidden(true)
            .foregroundColor(.clear)
    }
}

struct EmptyyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyyView()
    }
}
