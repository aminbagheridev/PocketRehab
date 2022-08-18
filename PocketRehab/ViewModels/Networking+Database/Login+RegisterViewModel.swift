//
//  Login+RegisterViewModel.swift
//  PocketRehab
//
//  Created by Amin  Bagheri  on 2022-07-20.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage
import SwiftUI

enum LoginRegisterErrors: Error {
    case someFieldsEmpty
    case invalidEmailFormat
    case invalidPasswordFormat
    case passwordsDoNotMatch
    case failedToMakeAccount
    case unableToSignoutUser
    case errorSendingEmailVerification
    case failedToReloadUserForVerification
    case userIsNotVerified
    case unableToConvertImageToData
    case unableToUploadImageToStorage
}

extension LoginRegisterErrors: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .someFieldsEmpty:
            return NSLocalizedString("Please make sure all fields are filled out.", comment: "")
        case .invalidEmailFormat:
            return NSLocalizedString("Please make sure your email is correct and in the right format.", comment: "")
        case .invalidPasswordFormat:
            return NSLocalizedString("Please make sure your password has atleast 8 characters, 1 number, 1 uppercase and 1 lowercase letter", comment: "")
        case .passwordsDoNotMatch:
            return NSLocalizedString("Passwords do not match.", comment: "")
        case .failedToMakeAccount:
            return NSLocalizedString("Failed to make account. Please try again.", comment: "")
        case .errorSendingEmailVerification:
            return NSLocalizedString("Failed to send verification email, please try again.", comment: "")
        case .failedToReloadUserForVerification:
            return NSLocalizedString("Failed to reload your user account for verification. Please try again!", comment: "")
        case .userIsNotVerified:
            return NSLocalizedString("Make sure you have verified your account and try again.", comment: "")
        case .unableToConvertImageToData:
            return NSLocalizedString("Unable to convert profile image to data", comment: "")
        case .unableToUploadImageToStorage:
            return NSLocalizedString("Unable to upload profile image to storage", comment: "")
            
        case .unableToSignoutUser:
            return NSLocalizedString("Unable to sign out user.", comment: "")
        }
        
        
    }
    
}


class LoginRegisterViewModel: ObservableObject {
    
    private let db = Firestore.firestore()
    private let storage = Storage.storage().reference()
    
    //MARK: Firestore Database
    func addUserData(firstName: String, lastName: String, email: String, profilePictureUrl: String) {
        db.collection("users").document(email.lowercased()).setData([
            "firstName": firstName,
            "lastName": lastName,
            "email": email.lowercased(),
            "profilePictureUrl": profilePictureUrl
        ]) { err in
            if let err = err {
                print("Error writing creating user document in database. ERROR: \(err)")
            } else {
                print("Document successfully written, user has been created!")
            }
        }
    }
    
    func updateUserData(firstName: String, lastName: String, email: String, profilePictureUrl: String) {
        db.collection("users").document(email.lowercased()).setData([
            "firstName": firstName,
            "lastName": lastName,
            "email": email.lowercased(),
            "profilePictureUrl": profilePictureUrl
        ]) { err in
            if let err = err {
                print("Error overwriting user document in database. ERROR: \(err)")
            } else {
                print("User successfully overwritten!")
            }
        }
    }
    
    func deleteUserData() {
        let user = Auth.auth().currentUser
        if let user = user {
            let email = user.email
            db.collection("users").document(email!.lowercased()).delete { err in
                if let err = err {
                    print("Error deleting user data. ERROR: \(err)")
                } else {
                    print("User data successfully deleted!")
                }
            }
        } else {
            print("failed to delete users data")
        }
    }
    
    func deleteUserImage() {
        
        let user = Auth.auth().currentUser
        if let user = user {
            // Create a reference to the file to delete
            let desertRef = storage.child("images/\(user.email!.lowercased()).jpg")

            // Delete the file
            desertRef.delete { error in
              if let error = error {
                  print("Error deleting user image: ", error.localizedDescription)
              } else {
                print("Image dleeted successfully")
              }
            }
        }
        
        
    }
    
    func getUserData(email: String, completion: @escaping(Result<DocumentSnapshot, Error>) -> Void) {
        db.collection("users").document(email.lowercased()).getDocument { document, error in
            if let error = error {
                print("Unable to retrieve user data. ERROR:", error)
                completion(.failure(error))
            } else if document != nil {
                // no errors...
                print("Successfully retrieved user data")
                completion(.success(document!))
            }
        }
    }
    
    //MARK: Firebase storage(profile photos)
    func uploadUserImage(email: String, image: Image?, completion: @escaping(Result<String, Error>) -> Void) {
        if image == nil {
            
            let uiImage = UIImage(named: "person")
            let imageData = uiImage!.jpegData(compressionQuality: 0.6)
            guard imageData != nil else {
                print("Unable to turn placeholder image to type Data")
                completion(.failure(LoginRegisterErrors.unableToConvertImageToData))
                return
            }
            // file reference
            let fileReference = storage.child("images/\(email.lowercased()).jpg")
            
            let uploadTask = fileReference.putData(imageData!) { metadata, error in
                if error != nil {
                    print("Unable to upload user profile image to storage")
                    completion(.failure(LoginRegisterErrors.unableToUploadImageToStorage))
                }
                if metadata != nil {
                    completion(.success("images/\(email.lowercased()).jpg"))
                    print("Profile image successful!")
                }
            }
        } else if image != nil {
            let uiImage = image!.asUIImage()
            let imageData = uiImage.jpegData(compressionQuality: 0.6)
            guard imageData != nil else {
                print("Unable to turn placeholder image to type Data")
                completion(.failure(LoginRegisterErrors.unableToConvertImageToData))
                return
            }
            // file reference
            let fileReference = storage.child("images/\(email.lowercased()).jpg")
            
            let uploadTask = fileReference.putData(imageData!) { metadata, error in
                if error != nil {
                    print("Unable to upload user profile image to storage")
                    completion(.failure(LoginRegisterErrors.unableToUploadImageToStorage))
                }
                if metadata != nil {
                    completion(.success("images/\(email.lowercased()).jpg"))
                    print("Profile image successful!")
                }
            }
        }
    }
    
    func retrieveUserProfilePhoto(email: String, completion: @escaping(Result<UIImage, Error>) -> Void) {
        getUserData(email: email.lowercased()) { result in
            switch result {
            case .success(let document):
                print("Successfully retrieved docuemnt snapshot")
                //Now we have access to the document snapshot
                let imagePath = document["profilePictureUrl"] as! String
                // file reference in firebase storage
                let fileReference = self.storage.child(imagePath)
                //retrieving the image from firebase storage
                fileReference.getData(maxSize: 5 * 1024 * 1024) { data, error in
                    if error != nil {
                        print("Error retrieving data from firebase storage")
                        completion(.failure(error!))
                    } else if data != nil {
                        let uiImage = UIImage(data: data!)
                        completion(.success(uiImage!))
                    }
                }
            case .failure(let error):
                print("Error retrieving docuemnt snapshot")
                completion(.failure(error))
            }
        }
    }
    
    //MARK: Firebase Authentication
    
    func sendPasswordResetTo(email: String, completion: @escaping(Result<Bool, Error>) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email.lowercased()) { error in
            if error == nil { // no error..
                print("Email successfully sent!")
                completion(.success(true))
            } else {
                print(error?.localizedDescription)
                completion(.failure(error!))
            }
        }
    }
    
    private func validateEmail(_ email: String) -> Bool {
        let lowercasedEmail = email.lowercased()
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: lowercasedEmail)
    }
    
    private func validatePassword(_ pass: String) -> Bool {
        let passRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", passRegex).evaluate(with: pass)
    }
    
    private func passwordsMatch(pass1: String, pass2: String) -> Bool {
        return pass1 == pass2
    }
    
    func loginUser(email: String, password: String, completion: @escaping(Result<Bool, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email.lowercased(), password: password) { result, error in
            if let err = error {
                print("Failed due to error:", err)
                completion(.failure(err))
                return
            } else {
                print("Successfully logged in with ID: \(result?.user.uid ?? "")")
                completion(.success(true))
            }
            
            
        }
    }
    
    func signOutUser(completion: @escaping(Result<Bool, Error>)-> Void) {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            completion(.success(true))
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
            completion(.failure(LoginRegisterErrors.unableToSignoutUser))
        }
    }
    
    func createUser(email: String, password: String, completion: @escaping(Result<Bool, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email.lowercased(), password: password, completion: { result, error in
            if let error = error {
                print("Failed due to error:", error)
                completion(.failure(error))
                return
            }
            print("Successfully created account with ID: \(result?.user.uid ?? "")")
            completion(.success(true))
        })
    }
    
    func sendVerificationEmail(completion: @escaping(Result<Bool, Error>) -> Void) {
        Auth.auth().currentUser?.sendEmailVerification { error in
            if let error = error {
                completion(.failure(error))
                return
            }
            completion(.success(true))
        }
    }
    
    func checkIfUserIsVerified(completion: @escaping(Result<Bool, Error>) -> Void) {
        Auth.auth().currentUser?.reload()
        
        Auth.auth().currentUser?.getIDTokenForcingRefresh(true) { _, _ in
        }
        
        if Auth.auth().currentUser!.isEmailVerified {
            completion(.success(true))
        } else {
            completion(.failure(LoginRegisterErrors.userIsNotVerified))
        }
    }
    
    func getSignedInUserEmail() -> String? {
        let user = Auth.auth().currentUser
        if let user = user {
            let email = user.email?.lowercased()
          return email
        }
        return nil
    }
    
    func checkIfRegisterFieldsAreValid(firstName: String, lastName: String, email: String, password: String, repeatedPassword: String, completion: @escaping(Result<Bool, Error>) -> Void)  {
        
        guard firstName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false, lastName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false, email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false, password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false, repeatedPassword.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false else {
            completion(.failure(LoginRegisterErrors.someFieldsEmpty))
            return
        }
        
        guard validateEmail(email.lowercased()) == true else {
            completion(.failure(LoginRegisterErrors.invalidEmailFormat))
            return
        }
        
        guard validatePassword(password) else {
            completion(.failure(LoginRegisterErrors.invalidPasswordFormat))
            return
        }
        
        guard passwordsMatch(pass1: password, pass2: repeatedPassword) else {
            completion(.failure(LoginRegisterErrors.passwordsDoNotMatch))
            return
        }
        
        completion(.success(true))
        
    }
    
    
    
    func deleteUser() {
        let user = Auth.auth().currentUser
        
        user?.delete { error in
            if let error = error {
                print("Error deleting user")
            } else {
                print("Account deleted.")
            }
        }
        signOutUser { result in
            switch result {
            case .success(_):
                print("Logged out user")
            case .failure(let error):
                print("Failed to logout user: ", error.localizedDescription)
            }
        }
    }
    
    func userSignedIn() -> Bool {
        if Auth.auth().currentUser != nil {
            return true
        } else {
            return false
        }
    }
    
    
    
    
}
