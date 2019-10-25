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
    
    var body: some View {
        VStack {
            VStack {
                Image("Ripple Icon").resizable()
                .frame(width: 130.0, height: 130.0)
            }
            .frame(height: UIScreen.main.bounds.height/2)
            VStack(spacing: 5) {

                TextField("Email or Phone Number", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(5)
                .cornerRadius(30)
                .frame(minWidth: 0, maxWidth: .infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.white, lineWidth: 2)
                )
                SecureField("Password", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
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
                    print("FOO")
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
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
