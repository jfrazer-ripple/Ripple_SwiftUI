//
//  AccountCreationPasswordCreation.swift
//  Ripple_SwiftUI
//
//  Created by justin frazer on 10/27/19.
//  Copyright © 2019 justin frazer. All rights reserved.
//

import SwiftUI

enum invalidPasswordAlert {
    case password, confirm
}

struct AccountCreationPasswordCreation: View {
    
    @State private var firstPasswordIsValid: Int = 0
    @State private var confirmPasswordIsValid: Int = 0
    @State private var firstPasswordString: String = ""
    @State private var confirmPasswordString: String = ""
    
    @State private var activeAlert: invalidPasswordAlert = .password
    @State private var showingAlert = false
    
    @Binding var pageToDisplay: Int
    
    @ViewBuilder
    var body: some View {
        VStack() {
            Image("Ripple Icon")
                .resizable()
                .frame(width: 130.0, height: 130.0)
                .padding(.top, 160)
            Text("Create a Password")
                .font(.headline)
                .fontWeight(.bold)
                .offset(x: 0, y: -10)
            if self.firstPasswordIsValid == 0 {
                SecureFieldWithColoredBorder(color: .white, placeholderText: "Password", password: $firstPasswordString)
                .offset(x: 0, y: -15)
            } else if self.firstPasswordIsValid == -1 {
                SecureFieldWithColoredBorder(color: .red, placeholderText: "Password", password: $firstPasswordString)
                .offset(x: 0, y: -15)
            } else {
                SecureFieldWithColoredBorder(color: .green, placeholderText: "Password", password: $firstPasswordString)
                .offset(x: 0, y: -15)
            }
            if self.confirmPasswordIsValid == 0 {
                SecureFieldWithColoredBorder(color: .white, placeholderText: "Confirm Password", password: $confirmPasswordString)
                .offset(x: 0, y: -15)
            } else if self.confirmPasswordIsValid == -1 {
                SecureFieldWithColoredBorder(color: .red, placeholderText: "Confirm Password", password: $confirmPasswordString)
                .offset(x: 0, y: -15)
            } else {
                SecureFieldWithColoredBorder(color: .green, placeholderText: "Confirm Password", password: $confirmPasswordString)
                .offset(x: 0, y: -15)
            }
            Button(action: {
                if self.firstPasswordString.count > 5 {
                    self.firstPasswordIsValid = 1
                } else {
                    self.firstPasswordIsValid = -1
                    self.showingAlert = true
                    self.activeAlert = .password
                }
                
                if self.firstPasswordIsValid == 1 {
                    if self.firstPasswordString == self.confirmPasswordString {
                        self.confirmPasswordIsValid = 1
                        self.pageToDisplay = 5
                    } else {
                        self.confirmPasswordIsValid = -1
                        self.showingAlert = true
                        self.activeAlert = .confirm
                    }
                }
            }) {
                ContinueText()
            }
            .offset(x: 0, y: -15)
            Spacer()
        }
        .padding(.horizontal, 20)
        .background(RadialGradient(gradient: Gradient(colors: [Color("RippleColorDark"), Color.black]), center: .center, startRadius: 5, endRadius: 300))
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle("Create Account", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .alert(isPresented: $showingAlert) {
            switch activeAlert {
            case .password:
                return Alert(title: Text("Invalid Password"), message: Text("Your password must be atleast 6 characters long"), dismissButton: .default(Text("Try Again")))
            case .confirm:
                return Alert(title: Text("Passwords Don't Match"), message: Text("The passwords you've entered do not match"), dismissButton: .default(Text("Try Again")))
            }
        }
    }
}

//struct AccountCreationPasswordCreation_Previews: PreviewProvider {
//    static var previews: some View {
//        AccountCreationPasswordCreation()
//    }
//}
