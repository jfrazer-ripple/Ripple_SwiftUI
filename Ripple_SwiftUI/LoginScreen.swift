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

                TextField("Email or Phone Number", text: $username)
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
                    self.userID = self.attemptLogin(str: self.username, pass: self.password)
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
    
    func attemptLogin(str: String, pass: String) -> Int {
        for user in myDataBase.allUsers {
            if user.email == str && user.password == pass {
                return user.id
            } else if user.phoneNumber == str && user.password == pass {
                return user.id
            }
        }
        return 0
    }
}

//struct LoginScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginScreen()
//    }
//}
