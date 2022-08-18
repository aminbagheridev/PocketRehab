//
//  LoginView.swift
//  PocketRehab
//
//  Created by Amin  Bagheri  on 2022-07-19.
//

import SwiftUI
import ExytePopupView


struct LoginView: View {
    enum Field: Hashable {
        case email
        case password
    }
    @EnvironmentObject var viewRouter: ViewRouter
    @StateObject private var VM = LoginRegisterViewModel()
    
    @FocusState private var focusedField: Field?
    @State var showingErrorPopup = false
    @AppStorage("loginErrorMessage") var loginErrorMessage: String = "Error"
    
    @State var showingResetPasswordPopup = false
    @State var cannotSendEmail = true
    @State var resetEmail = ""
    @State var resetEmailSuccessfullySent = false
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Image("PocketRehabTransparentLogo")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .shadow(radius: 10)
                        .padding(.bottom)
                    // MARK: - Name TextField
                    TextField("Email", text: $email)
                        .textFieldStyle(
                            GradientTextFieldBackground(
                                systemImageString: "envelope"
                            )
                        )
                        .focused($focusedField, equals: .email)
                        .frame(width: UIScreen.main.bounds.width * 0.9)
                        .padding(.bottom, 5)
                        .submitLabel(.continue)
                        .onSubmit {
                            focusedField = .password
                        }
                    
                    // MARK: Email TextField
                    SecureField("Password", text: $password
                    )
                    .textFieldStyle(
                        GradientTextFieldBackground(
                            systemImageString: "lock"
                        )
                    )
                    .submitLabel(.done)
                    .frame(width: UIScreen.main.bounds.width * 0.9)
                    .focused($focusedField, equals: .password)
                    .padding(.bottom, 5)
                    .onSubmit {}
                    Button {
                        //TODO: PERFORM LOGIN CODE
                        VM.loginUser(email: email.lowercased(), password: password) { result in
                            switch result {
                                
                            case .success(_):
                                print("Login successful!")
                                VM.getUserData(email: email.lowercased()) { result in
                                    switch result {
                                    case .success(let document):
                                        let data = document.data()
                                        let email = data!["email"]! as? String ?? ""
                                        let firstName = data!["firstName"]! as? String ?? ""
                                        let lastName = data!["lastName"]! as? String ?? ""
                                        let profilePictureUrl = data!["profilePictureUrl"]! as? String ?? ""
                                        UserDefaults.standard.set(firstName, forKey: "firstName")
                                        VM.updateUserData(
                                            firstName: firstName,
                                            lastName: lastName,
                                            email: email.lowercased(),
                                            profilePictureUrl: profilePictureUrl)
                                        VM.retrieveUserProfilePhoto(email: email.lowercased()) { result in
                                            switch result {
                                            case .success(let uiImageToSave):
                                                let data = uiImageToSave.jpegData(compressionQuality: 1)
                                                UserDefaults.standard.set(data, forKey: "imageData")
                                            case .failure(let error):
                                                print("Error fetching user image: ", error.localizedDescription)
                                            }
                                        }
                                    case .failure(let error):
                                        print(error.localizedDescription)
                                    }
                                }
                                
                                viewRouter.currView = .home
                            case .failure(let error):
                                loginErrorMessage = error.localizedDescription
                                print("LOGIN ERROR: ", loginErrorMessage)
                                
                                showingErrorPopup = true
                            }
                        }
                    } label: {
                        ZStack {
                            Rectangle()
                                .fill(LinearGradient(colors: [Color.init(hex: ColorScheme.darkBlue), Color.init(hex: ColorScheme.lightBlue)], startPoint: .topLeading, endPoint: .bottomTrailing))
                                .cornerRadius(5)
                                .frame(width: UIScreen.main.bounds.width * 0.9)
                                .frame(height: 50)

                            
                            Text("Login")
                                .font(.system(size: 25, weight: .bold))
                                .foregroundColor(.white)
                                .shadow(radius: 10)
                        }
                        
                    }
                    .padding(.bottom, 5)
                    HStack {
                        Rectangle()
                            .frame(width: 0, height: 0)
                            .foregroundColor(.clear)
                        Spacer()
                        Button {
                            showingResetPasswordPopup = true
                        } label: {
                            Text("Forgot password?")
                                .font(.system(size: 14, weight: .medium, design: .default))
                        }
                        .foregroundColor(Color("m"))
                    }
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Login")
            .navigationBarItems(trailing: NavigationLink(destination: RegisterView(), label: {
                Text("Register")
                    .font(.system(size: 20, weight: .bold, design: .default))
                .foregroundColor(Color("m"))
                
            }))
            .popup(isPresented: $showingErrorPopup, type: .toast, position: .bottom, animation: .easeInOut(duration: 1), autohideIn: 5, dragToDismiss: true, closeOnTap: true, closeOnTapOutside: true) {
                ZStack {
                    RoundedRectangle(cornerRadius: 30.0)
                        .frame(width: UIScreen.main.bounds.width * 0.9, height: 100)
                        .foregroundColor(.red)
                        .shadow(radius: 10)
                    Text(loginErrorMessage)
                        .foregroundColor(.white)
                        .shadow(radius: 10)
                        .frame(width: UIScreen.main.bounds.width * 0.8, height: 100)
                        .font(.system(size: 20, weight: .medium, design: .default))
                }
                .padding(.vertical, 25)
            }
            .popup(isPresented: $showingResetPasswordPopup, type: .default, animation: .easeInOut(duration: 1), autohideIn: 9999999999999999999, dragToDismiss: false, closeOnTap: false, closeOnTapOutside: true) {
                ZStack {
                    RoundedRectangle(cornerRadius: 30.0)
                        .frame(width: UIScreen.main.bounds.height * 0.5 - 100, height: UIScreen.main.bounds.height * 0.5)
                        .foregroundColor(.white)
                        .shadow(radius: 10)
                    VStack {
                        HStack {
                            Rectangle()
                                .frame(width: UIScreen.main.bounds.height * 0.5 - 200, height: 44)
                                .accessibility(hidden: true)
                                .foregroundColor(.clear)
                            
                            Button {
                                showingResetPasswordPopup = false
                            } label: {
                                Image(systemName: "xmark")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(.black)
                                    .padding()
                                    .background(Color.clear)
                                
                            }
                            
                        }
                        TextField("Email", text: $resetEmail)
                            .textFieldStyle(
                                GradientTextFieldBackground(
                                    systemImageString: "envelope"
                                )
                            )
                            .padding(.bottom, 20)
                            .frame(width: UIScreen.main.bounds.height * 0.5 - 160, height: 44)
                        Button {
                            VM.sendPasswordResetTo(email: resetEmail.lowercased()) { result in
                                switch result {
                                    
                                case .success(_):
                                    resetEmailSuccessfullySent = true
                                case .failure(let error):
                                    loginErrorMessage = error.localizedDescription
                                    print("PASSWORD RESET ERROR: ", loginErrorMessage)
                                    
                                    showingErrorPopup = true
                                }
                            }
                            
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 50)
                                    .frame(width: UIScreen.main.bounds.height * 0.5 - 160, height: 50)
                                    .foregroundColor(.green)
                                    .shadow(radius: 10)
                                Text("Send Password Reset Email")
                                    .foregroundColor(.white)
                                    .frame(width: UIScreen.main.bounds.height * 0.5 - 160, height: 50)
                                    .font(.system(size: 20, weight: .bold))
                                    .shadow(radius: 20)

                            }
                            
                        }
                        .disabled(cannotSendEmail)
                        .alert("Success! Check your inbox (and spam!) to reset your password.", isPresented: $resetEmailSuccessfullySent) {
                            Button("OK", role: .cancel) {
                                resetEmailSuccessfullySent = false
                            }
                        }
                    }
                    
                    
                    
                    
                }
                .padding(.vertical, 25)
            }
            .onChange(of: resetEmail) { newValue in
                email = resetEmail.lowercased()
                if resetEmail.trimmingCharacters(in: .whitespaces).count > 1 {
                    cannotSendEmail = false
                } else {
                    cannotSendEmail = true
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(ViewRouter())
    }
}
