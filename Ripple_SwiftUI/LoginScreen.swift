//
//  LoginScreen.swift
//  Ripple_SwiftUI
//
//  Created by justin frazer on 10/24/19.
//  Copyright © 2019 justin frazer. All rights reserved.
//

import SwiftUI

struct LoginScreen: View {
    
    @State private var passwordStatus = 0
    @State private var usernameOrEmailStatus = 0
    
    @State var emailOrUsername: String = ""
    @State var password: String = ""
    
    @Binding var userID: Int
    
    var body: some View {
        VStack {
            VStack {
                Image("Ripple Icon").resizable()
                .frame(width: 130.0, height: 130.0)
            }
            .frame(height: UIScreen.main.bounds.height/2)
            VStack(spacing: 5) {
                if usernameOrEmailStatus == 0 { //Default value, user hasn't attempted to log in
                    TextFieldWithColoredBorder(color: .white, emailOrUsername: $emailOrUsername)
                } else if usernameOrEmailStatus == 1 { //User attempted to login, but the email/username was not found
                    TextFieldWithColoredBorder(color: .red, emailOrUsername: $emailOrUsername)
                }  else if usernameOrEmailStatus == 2 { //User has a valid email/username
                    TextFieldWithColoredBorder(color: .green, emailOrUsername: $emailOrUsername)
                }
                if passwordStatus == 0 { //Default value, user hasn't attempted to log in
                    SecureFieldWithColoredBorder(color: .white, password: $password)
                } else if passwordStatus == 1 { //User attempted to login, but the password was not correct
                    SecureFieldWithColoredBorder(color: .red, password: $password)
                }  else if passwordStatus == 2 { //User has a valid email/username with the corresponding password
                    SecureFieldWithColoredBorder(color: .green, password: $password)
                }
                Button(action: {
                    let loginAttempt = self.attemptLogin(str: self.emailOrUsername, pass: self.password)
                    if loginAttempt == 0 { // username/email exists, but the password was incorrect
                        self.usernameOrEmailStatus = 2
                        self.passwordStatus = 1
                    } else if loginAttempt == -1 { // unable to find the user given the email/username
                        self.usernameOrEmailStatus = 1
                        self.passwordStatus = 0
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
                Text("Create an Account")
                    .bold()
                    .foregroundColor(.white)
                Text("Forgot Your Password?")
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                Spacer()
                }
            .padding(.horizontal, 20)
        }
        .background(RadialGradient(gradient: Gradient(colors: [Color("RippleColorDark"), Color.black]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/, endRadius: /*@START_MENU_TOKEN@*/500/*@END_MENU_TOKEN@*/))
        .edgesIgnoringSafeArea(.all)
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


//struct LoginScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginScreen()
//    }
//}
