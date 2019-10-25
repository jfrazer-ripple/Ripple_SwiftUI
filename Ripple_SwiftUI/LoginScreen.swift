//
//  LoginScreen.swift
//  Ripple_SwiftUI
//
//  Created by justin frazer on 10/24/19.
//  Copyright © 2019 justin frazer. All rights reserved.
//

import SwiftUI

struct LoginScreen: View {
    
    @State var username: String = ""
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

                TextField("Email or Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(5)
                .cornerRadius(30)
                .frame(minWidth: 0, maxWidth: .infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.white, lineWidth: 2)
                )
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .foregroundColor(.black)
                .padding(5)
                .cornerRadius(30)
                .frame(minWidth: 0, maxWidth: .infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.white, lineWidth: 2)
                )
                Button(action: {
                    let loginAttempt = self.attemptLogin(str: self.username, pass: self.password)
                    if  loginAttempt != 0 { //Successful Login
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
