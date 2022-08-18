//
//  SettingsView.swift
//  PocketRehab
//
//  Created by Amin  Bagheri  on 2022-07-22.
//

import SwiftUI

class Update: ObservableObject {
    
    @Published var shouldUpdate: Bool = false
}

struct SettingsView: View {
    @State private var showingAlert = false

    @EnvironmentObject var viewRouter: ViewRouter
    @StateObject private var VM = LoginRegisterViewModel()
    @State var name: String = ""
    @StateObject var updateVM = Update()
    
    var body: some View {
        VStack {
            Button {
                VM.signOutUser { result in
                    switch result {
                    case.success(_):
                        viewRouter.currView = .login
                    case.failure(let error):
                        //TODO: MAKE SURE TO ALLOW FOR POPUP INCASE OF FAILURE
                        print(error.localizedDescription)
                    }
                }
                

            } label: {
                Text("Logout")
                    .fontWeight(.heavy)
                    .font(.title2)
                    .foregroundColor(.red)
            }
            Button {
                
                showingAlert = true
                

            } label: {
                Text("Delete Account")
                    .fontWeight(.black)
                    .font(.title2)
                    .foregroundColor(.red)
            }
            .padding()
            .alert("Account deletion", isPresented: $showingAlert) {
                Button("Are you sure?", role: .destructive) {
                    VM.deleteUserData()
                    VM.deleteUserImage()
                    VM.deleteUser()
                    viewRouter.currView = .login
                        }
                Button("Cancel", role: .cancel) {}
                    }
            
            NavigationLink {
                SourcesView()
            } label: {
                Text("App Sources")
                    .fontWeight(.heavy)
                            .font(.title2)
                            .foregroundColor(.blue)
            }

            
            
            
            


        }
        
    }
        
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
