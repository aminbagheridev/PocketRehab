//
//  RegisterView.swift
//  PocketRehab
//
//  Created by Amin  Bagheri  on 2022-07-19.
//

import SwiftUI
import ExytePopupView
import ActivityIndicatorView

struct RegisterView: View {
    enum Field: Hashable {
        case firstName
        case lastName
        case email
        case password
        case repeatedPassword
    }
    
    @State var registrationErrorCount = 0
    
    @Environment(\.presentationMode) var presentation
    @Environment(\.scenePhase) var scenePhase
    @EnvironmentObject var viewRouter: ViewRouter
    
    @FocusState private var focusedField: Field?
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var password = ""
    @State var repeatedPassword = ""
    @State var imageUrl = ""
    
    @State var alertSheet = false
    @State var alertSheetMessage = ""
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var image: Image?
    
    
    @StateObject private var VM = LoginRegisterViewModel()
    @State var showingErrorPopup = false
    @AppStorage("errorMessage") var errorMessage: String = "Error"
    
    @State var showLoadingIndicator = false
    
    @State var showEmailVerificationPopup = false
    @State var cancelVerificationButtonPressed = false
    @State var doneVerificationButtonPressed = false
    
    @State var isLoggedIn = false
        
    var body: some View {
        ZStack {
            
            
            
            ScrollView {
                VStack {
                    VStack {
                        
                        Button {
                            print("Add profile pic button pressed.")
                            alertSheet.toggle()
                            
                        } label: {
                            ZStack(alignment: .bottomTrailing){
                                if image == nil {
                                    Image(uiImage: UIImage(named: "person")!)
                                        .resizable()
                                        .frame(width:150, height: 150)
                                        .clipShape(Circle())
                                        .foregroundColor(.black)
                                } else if image != nil {
                                    image!
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipShape(Circle())
                                        .frame(width: 150, height: 150)
                                    
                                }
                                
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                                    .frame(width: 37.5, height: 37.5)
                                    .background(Color.blue)
                                    .clipShape(Circle())
                            }
                            .shadow(radius: 10)
                            .padding(.vertical, 20)
                            
                        }.actionSheet(isPresented: $alertSheet, content: {
                            
                            let action1 = ActionSheet.Button.default(Text("Add Photo")) {
                                print("Adding")
                                showingImagePicker = true
                            }
                            
                            let action2 = ActionSheet.Button.default(Text("Remove Photo").foregroundColor(.red)) {
                                image = nil
                            }
                            let action3 = ActionSheet.Button.default(Text("Cancel").foregroundColor(.gray)) {
                                alertSheet = false
                            }
                            
                            
                            
                            
                            return ActionSheet(title: Text("Add profile picture"), buttons: [action1, action2, action3])
                        })
                        
                    }
                    
                    
                    TextField("First Name", text: $firstName)
                        .textFieldStyle(
                            GradientTextFieldBackground(
                                systemImageString: "person"
                            )
                        )
                        .frame(width: UIScreen.main.bounds.width * 0.9)
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                        .focused($focusedField, equals: .firstName)
                        .submitLabel(.continue)
                        .onSubmit {
                            focusedField = .lastName
                        }
                    TextField("Last Name", text: $lastName)
                        .textFieldStyle(
                            GradientTextFieldBackground(
                                systemImageString: "person"
                            )
                        )
                        .frame(width: UIScreen.main.bounds.width * 0.9)
                        .padding(.horizontal)
                        .padding(.bottom, 5)
                        .focused($focusedField, equals: .lastName)
                        .submitLabel(.continue)
                        .onSubmit {
                            focusedField = .email
                        }
                    
                    TextField("Email", text: $email)
                        .textFieldStyle(
                            GradientTextFieldBackground(
                                systemImageString: "envelope"
                            )
                        )
                        .frame(width: UIScreen.main.bounds.width * 0.9)
                        .padding(.horizontal)
                        .padding(.bottom, 5)
                        .focused($focusedField, equals: .email)
                        .submitLabel(.continue)
                        .onSubmit {
                            focusedField = .password
                        }
                    SecureField("Password", text: $password)
                        .textFieldStyle(
                            GradientTextFieldBackground(
                                systemImageString: "lock"
                            )
                        )
                        .frame(width: UIScreen.main.bounds.width * 0.9)
                        .padding(.horizontal)
                        .padding(.bottom, 5)
                        .focused($focusedField, equals: .password)
                        .submitLabel(.continue)
                        .onSubmit {
                            focusedField = .repeatedPassword
                        }
                    SecureField("Repeat Password", text: $repeatedPassword)
                        .textFieldStyle(
                            GradientTextFieldBackground(
                                systemImageString: "lock"
                            )
                        )
                        .focused($focusedField, equals: .repeatedPassword)
                        .frame(width: UIScreen.main.bounds.width * 0.9)
                        .padding(.horizontal)
                        .padding(.bottom, 5)
                        .submitLabel(.done)
                        .onSubmit {
                            //resigns first responder
                        }
                    Button {
                        showLoadingIndicator = true
                        VM.checkIfRegisterFieldsAreValid(firstName: firstName, lastName: lastName, email: email.lowercased(), password: password, repeatedPassword: repeatedPassword) { result in
                            switch result {
                            case .success(_):
                                print("Fields are valid!")
                                
                                VM.createUser(email: email.lowercased(), password: password) { result in
                                    switch result {
                                    case .success(_):
                                        
                                        print("SUccess! Account was made.")
                                        VM.sendVerificationEmail { result in
                                            switch result {
                                            case .success(_):
                                                
                                                print("Email verification sent! !!!!!")
                                                showLoadingIndicator = false
                                                
                                                showEmailVerificationPopup = true
                                            case .failure(let error):
                                                
                                                errorMessage = error.localizedDescription
                                                print("ERROR1: ", errorMessage)
                                                
                                                
                                                showingErrorPopup = true
                                            }
                                        }
                                    case .failure(let error):
                                        
                                        errorMessage = error.localizedDescription
                                        print("ERROR2: ", errorMessage)
                                        
                                        
                                        showingErrorPopup = true
                                    }
                                }
                                
                            case .failure(let error):
                                
                                errorMessage = error.localizedDescription
                                print("ERROR3: ", errorMessage)
                                
                                
                                showingErrorPopup = true
                                
                            }
                        }
                        
                        
                    } label: {
                        ZStack {
                            Rectangle()
                                .fill(LinearGradient(colors: [Color.init(hex: ColorScheme.darkBlue), Color.init(hex: ColorScheme.lightBlue)], startPoint: .topLeading, endPoint: .bottomTrailing))
                                .cornerRadius(5)
                                .frame(width: UIScreen.main.bounds.width * 0.9, height: 50)
                                

                            Text("Register")
                                .font(.system(size: 25, weight: .bold))
                                .foregroundColor(.white)
                                .shadow(radius: 10)
                        }
                        
                    }
                    .padding(.bottom, 5)
                    
                    
                }
                
            }
            .onChange(of: inputImage, perform: { _ in loadImage() })
            
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                
                if showEmailVerificationPopup && VM.userSignedIn() {
                    VM.deleteUser()
                    self.presentation.wrappedValue.dismiss()
                } else {
                    self.presentation.wrappedValue.dismiss()
                }
                
                
            }, label: {
                HStack {
                    Image(systemName: "arrow.left")
                    Text("Go Back")
                }
                .foregroundColor(Color("m"))
            }))
            .navigationTitle("Register")
            .accentColor(.black)
            .popup(isPresented: $showEmailVerificationPopup, type: .default, animation: .easeInOut, autohideIn: .infinity, dragToDismiss: false, closeOnTap: false, closeOnTapOutside: false) {
                
                VerificationPopupView(showEmailVerificationPopup: $showEmailVerificationPopup, doneVerificationButtonPressed: $doneVerificationButtonPressed, cancelVerificationButtonPressed: $cancelVerificationButtonPressed)
                
            }
            .popup(isPresented: $showingErrorPopup, type: .toast, position: .bottom, animation: .easeInOut(duration: 1), autohideIn: 5, dragToDismiss: true, closeOnTap: true, closeOnTapOutside: true) {
                ZStack {
                    RoundedRectangle(cornerRadius: 30.0)
                        .frame(width: UIScreen.main.bounds.width * 0.9, height: 100)
                        .foregroundColor(.red)
                        .shadow(radius: 10)
                    Text(errorMessage)
                        .foregroundColor(.white)
                        .shadow(radius: 10)
                        .frame(width: UIScreen.main.bounds.width * 0.8, height: 100)
                        .font(.system(size: 20, weight: .medium, design: .default))
                }
                .padding(.vertical, 25)
                
                
            }
            .onChange(of: doneVerificationButtonPressed) { newValue in
                print("Done verification button pressed!")
                
                VM.checkIfUserIsVerified { result in
                    switch result {
                        
                    case .success(_):
                        print("verified!")
                        
                        VM.uploadUserImage(email: email.lowercased(), image: image) { result in
                            switch result {
                            case .success(let imageUrl):
                                self.imageUrl = imageUrl
                                VM.addUserData(firstName: firstName, lastName: lastName, email: email.lowercased(), profilePictureUrl: imageUrl)
                                
                                //now we have a storage file with a specific profile photo, we also have a databse online with user data loaded, and finally, we are going to be creating a local cache that stores the necessary data we need in order to run the app smoothly and save bandwith, money etc.
                                
                                let imageForSaving = dataFromImage(image)
                                UserDefaults.standard.set(imageForSaving, forKey: "imageData")
                                UserDefaults.standard.set(firstName, forKey: "firstName")
                                
                                viewRouter.currView = .home
                            case .failure(let error):
                                errorMessage = error.localizedDescription
                                print("ERROR3: ", errorMessage)
                                print("At this point if there is an error.... :O")
                                showingErrorPopup = true
                            }
                        }
                        //TODO: Get user image, put to storage under his email, and then put the url instead of" test-url". if image = nil, then just use the system image.
                        
                    case .failure(let error):
                        registrationErrorCount += 1
                        if registrationErrorCount == 2 {
                            errorMessage = error.localizedDescription
                            print("ERROR3: ", errorMessage)
                            
                            
                            showingErrorPopup = true
                        }
                    }
                }
            }
        }
        .onChange(of: cancelVerificationButtonPressed) { newValue in
            print("Cancel verificication button pressed")
            //TODO: Delete user
            
            VM.deleteUser()
            
        }
//        .onChange(of: scenePhase) { newPhase in
//            if newPhase == .inac && VM.userSignedIn() && showEmailVerificationPopup {
//                VM.deleteUser()
//                showEmailVerificationPopup = false
//
//            }
//        }
        
        
        Spacer()
    }
    //        NavigationLink(destination: MainView(), isActive: $isLoggedIn) { EmptyView() }
    //        ActivityIndicatorView(isVisible: $showLoadingIndicator, type: .flickeringDots(count: 8))
    //            .frame(width: 75, height: 75)
    //            .foregroundColor(.black)
    //                 .ignoresSafeArea()
    //                 .background(
    //                    Rectangle()
    //                        .frame(width: 100, height: 100)
    //                        .opacity(0.2)
    //                        .cornerRadius(20)
    //                        .shadow(radius: 10)
    //                        .blur(radius: 1))
    
    
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        
    }
}


struct RegisterView_Previews: PreviewProvider {
    @State static var verificationDoneButtonPressed: Bool = false
    @State static var cancelButtonPressed: Bool = false
    static var previews: some View {
        RegisterView()
    }
}
