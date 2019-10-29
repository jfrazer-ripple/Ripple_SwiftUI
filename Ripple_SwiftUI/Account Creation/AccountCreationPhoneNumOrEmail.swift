//
//  AccountCreationPhoneNumOrEmail.swift
//  Ripple_SwiftUI
//
//  Created by justin frazer on 10/26/19.
//  Copyright © 2019 justin frazer. All rights reserved.
//

import SwiftUI

enum PhoneNumberOrEmailAlert {
    case phone, email
}

struct AccountCreationPhoneNumOrEmail: View {
    
    @State private var emailOrPhoneNumber: String = ""
    @State private var phoneNumberOrEmailValid: Int = 0
    @State private var emailPreferred: Bool = false
    @State private var activeAlert: PhoneNumberOrEmailAlert = .phone
    @State private var showingAlert = false

    @Binding var pageToDisplay: Int
    
    @ViewBuilder
    var body: some View {
        VStack() {
            Image("Ripple Icon")
                .resizable()
                .frame(width: 130.0, height: 130.0)
                .padding(.top, 160)
            if emailPreferred {
                Text("What's Your Email Address?")
                    .font(.headline)
                    .fontWeight(.bold)
                    .offset(x: 0, y: -10)
            } else {
                Text("What's Your Phone Number?")
                    .font(.headline)
                    .fontWeight(.bold)
                    .offset(x: 0, y: -10)
            }
            Button(action: {
                self.emailPreferred.toggle()
                self.phoneNumberOrEmailValid = 0
            }) {
                if emailPreferred {
                    Text("I'd rather use my phone number")
                        .font(.subheadline)
                } else {
                    Text("I'd rather use my email")
                        .font(.subheadline)
                }
            }
            .foregroundColor(.white)
            .padding(15)
            .frame(minWidth: 0, maxWidth: .infinity)
            if emailPreferred {
                if phoneNumberOrEmailValid == 0 {
                    TextFieldWithColoredBorder(color: .white, placeholderText: "Email Address", emailOrUsername: $emailOrPhoneNumber)
                } else if phoneNumberOrEmailValid == -1 {
                    TextFieldWithColoredBorder(color: .red, placeholderText: "Email Address", emailOrUsername: $emailOrPhoneNumber)
                } else {
                    TextFieldWithColoredBorder(color: .green, placeholderText: "Email Address", emailOrUsername: $emailOrPhoneNumber)
                }
            } else {
                if phoneNumberOrEmailValid == 0 {
                    TextFieldWithColoredBorder(color: .white, placeholderText: "Phone Number", emailOrUsername: $emailOrPhoneNumber)
                } else if phoneNumberOrEmailValid == -1 {
                    TextFieldWithColoredBorder(color: .red, placeholderText: "Phone Number", emailOrUsername: $emailOrPhoneNumber)
                } else {
                   TextFieldWithColoredBorder(color: .green, placeholderText: "Phone Number", emailOrUsername: $emailOrPhoneNumber)
               }
            }
            Button(action: {
                if self.emailPreferred {
                    if self.isValidEmail(emailStr: self.emailOrPhoneNumber) == -1 {
                        self.phoneNumberOrEmailValid = -1
                        self.showingAlert = true
                        self.activeAlert = .email
                    } else {
                        self.phoneNumberOrEmailValid = 1
                        self.pageToDisplay = 2
                    }
                } else {
                    if self.isValidPhoneNumber(phoneStr: self.emailOrPhoneNumber) == -1 {
                        self.phoneNumberOrEmailValid = -1
                        self.showingAlert = true
                        self.activeAlert = .phone
                    } else {
                        self.phoneNumberOrEmailValid = 1
                        self.pageToDisplay = 2
                    }
                }
            }) {
                    ContinueText()
                }
            Spacer()
        }
        .padding(.horizontal, 20)
        .background(RadialGradient(gradient: Gradient(colors: [Color("RippleColorDark"), Color.black]), center: .center, startRadius: 5, endRadius: 300))
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle("Create Account", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .alert(isPresented: $showingAlert) {
            switch activeAlert {
            case .email:
                return Alert(title: Text("Invalid Email Address"), message: Text("The email you entered isn't in our system"), dismissButton: .default(Text("Try Again")))
            case .phone:
                return Alert(title: Text("Invalid Phone Number"), message: Text("The phone number you entered is invalid"), dismissButton: .default(Text("Try Again")))
            }
        }
    }
    
    /*
     Returns 1 if the email provided is valid, returns -1 otherwise
     */
     func isValidEmail(emailStr:String) -> Int {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailPred.evaluate(with: emailStr)
        if result {
            return 1
        } else {
            return -1
        }
    }
    
    /*
     Returns 1 if the phone number provided is valid, returns -1 otherwise
     */
    func isValidPhoneNumber(phoneStr: String) -> Int {
        let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: phoneStr)
        if result {
            return 1
        } else {
            return -1
        }
    }
}

//struct AccountCreationPhoneNumOrEmail_Previews: PreviewProvider {
//    static var previews: some View {
//        AccountCreationPhoneNumOrEmail()
//    }
//}
