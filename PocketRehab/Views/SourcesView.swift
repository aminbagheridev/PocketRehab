//
//  SourcesView.swift
//  PocketRehab
//
//  Created by Amin  Bagheri  on 2022-08-14.
//

import SwiftUI

struct SourcesView: View {
    
    @State var sourceLinks: [String] = ["https://www.webmd.com/pain-management/ss/slideshow-ankle-problems-pain", "https://www.mayoclinic.org/diseases-conditions/back-pain/symptoms-causes/syc-20369906", "https://www.mayoclinic.org/symptoms/shoulder-pain/basics/causes/sym-20050696", "https://www.pennmedicine.org/for-patients-and-visitors/patient-information/conditions-treated-a-to-z/shoulder-pain", "https://www.medicalnewstoday.com/articles/knee-stretches", "https://www.beaumont.org/services/pain-management-services/knee-mobility", "https://www.healthline.com/health/chronic-pain/shoulder-pain", "https://www.webmd.com/back-pain/features/manage-low-back-pain-home", "https://my.clevelandclinic.org/health/symptoms/15295-ankle-pain", "https://www.mayoclinic.org/symptoms/ankle-pain/basics/causes/sym-20050796", "https://www.mayoclinic.org/diseases-conditions/neck-pain/symptoms-causes/syc-20375581", "https://my.clevelandclinic.org/health/symptoms/21179-neck-pain", "https://www.mayoclinic.org/diseases-conditions/wrist-pain/symptoms-causes/syc-20366213", "https://www.mayoclinic.org/symptoms/elbow-pain/basics/causes/sym-20050874", "https://saltwrap.com/pages/built-from-broken"]
    
    @State var source: Int = 0
    
    var body: some View {
        List {
            ForEach(sourceLinks, id:  \.self) { sourceString in
                Link(destination: URL(string: sourceString)!) {
                    Text(sourceString)
                }
            }
        }
        .navigationTitle("Sources")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

struct SourcesView_Previews: PreviewProvider {
    static var previews: some View {
        SourcesView()
    }
}
