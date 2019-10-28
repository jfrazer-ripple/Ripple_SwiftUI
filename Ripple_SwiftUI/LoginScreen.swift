//
//  LoginScreen.swift
//  Ripple_SwiftUI
//
//  Created by justin frazer on 10/24/19.
//  Copyright © 2019 justin frazer. All rights reserved.
//

import SwiftUI

enum ActiveAlert {
    case emailOrUsername, password
}

struct LoginScreen: View {
    
    @State private var passwordStatus = 0
    @State private var usernameOrEmailStatus = 0
    @State private var showingAlert = false
    @State private var activeAlert: ActiveAlert = .emailOrUsername
    
    @State var emailOrUsername: String = ""
    @State var password: String = ""
    
    @Binding var userID: Int
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Image("Ripple Icon").resizable()
                    .frame(width: 130.0, height: 130.0)
                }
                .frame(height: UIScreen.main.bounds.height/2)
                VStack(spacing: 5) {
                    if usernameOrEmailStatus == 0 { //Default value, user hasn't attempted to log in
                        TextFieldWithColoredBorder(color: .white, placeholderText: "Email or Username", emailOrUsername: $emailOrUsername)
                    } else if usernameOrEmailStatus == 1 { //User attempted to login, but the email/username was not found
                        TextFieldWithColoredBorder(color: .red, placeholderText: "Email or Username", emailOrUsername: $emailOrUsername)
                    }  else { //User has a valid email/username
                        TextFieldWithColoredBorder(color: .green, placeholderText: "Email or Username", emailOrUsername: $emailOrUsername)
                    }
                    if passwordStatus == 0 { //Default value, user hasn't attempted to log in
                        SecureFieldWithColoredBorder(color: .white, placeholderText: "Password", password: $password)
                    } else if passwordStatus == 1 { //User attempted to login, but the password was not correct
                        SecureFieldWithColoredBorder(color: .red, placeholderText: "Password", password: $password)
                    }  else { //User has a valid email/username with the corresponding password
                        SecureFieldWithColoredBorder(color: .green, placeholderText: "Password", password: $password)
                    }
                    Button(action: {
                        let loginAttempt = self.attemptLogin(str: self.emailOrUsername, pass: self.password)
                        if loginAttempt == 0 { // username/email exists, but the password was incorrect
                            self.usernameOrEmailStatus = 2
                            self.passwordStatus = 1
                            self.activeAlert = .password
                            self.showingAlert.toggle()
                        } else if loginAttempt == -1 { // unable to find the user given the email/username
                            self.usernameOrEmailStatus = 1
                            self.passwordStatus = 0
                            self.activeAlert = .emailOrUsername
                            self.showingAlert.toggle()
                        } else {
                            self.usernameOrEmailStatus = 2
                            self.passwordStatus = 2
                            self.userID = loginAttempt
                        }
                    }) {
                        Text("Login")
                    }
                    .foregroundColor(.white)
                    .padding(5)
                    .cornerRadius(30)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.white, lineWidth: 2)
                    )
                    Spacer()
                    NavigationLink(destination: CreateAccountTermsAndConditions()) {
                        Text("Create an Account")
                            .foregroundColor(.white)
                    }
                    NavigationLink(destination: ForgotPassword()) {
                        Text("Forgot Password?")
                            .foregroundColor(.white)
                            .padding()
                    }
                    Spacer()
                }
                .padding(.horizontal, 20)
            }
            .background(RadialGradient(gradient: Gradient(colors: [Color("RippleColorDark"), Color.black]), center: .center, startRadius: 5, endRadius: 300))
            .edgesIgnoringSafeArea(.all)
            .alert(isPresented: $showingAlert) {
                switch activeAlert {
                case .emailOrUsername:
                    return Alert(title: Text("Invalid Username or Email"), message: Text("The email or username you entered isn't in our system"), dismissButton: .default(Text("Try Again")))
                case .password:
                    return Alert(title: Text("Invalid Password"), message: Text("The password you entered is incorrect"), dismissButton: .default(Text("Try Again")))
                }
            }
        }
    }
    
    /*
     This function will attempt to login to the app given a username or email and a password
        - Returning 0 means the username/email exists, but the password was incorrect
        - Returning -1 means the username/email does not exist
    */
    func attemptLogin(str: String, pass: String) -> Int {
        for user in myDataBase.allUsers {
            if user.email == str || user.username == str { //we found an entry for given email/username
                if user.password == pass { //Passwords match, allow user to login
                    return user.id
                } else { //Passwords do NOT match, reject the login
                    return 0
                }
            }
        }
        return -1 //Unable to find the user with the given username/email, return 0
    }
}


struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen(userID: .constant(0))
    }
}
