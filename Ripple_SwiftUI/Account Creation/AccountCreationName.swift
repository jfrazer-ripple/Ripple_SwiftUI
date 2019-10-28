//
//  AccountCreationName.swift
//  Ripple_SwiftUI
//
//  Created by justin frazer on 10/26/19.
//  Copyright © 2019 justin frazer. All rights reserved.
//

import SwiftUI

enum invalidNameAlert {
    case first, last, both
}

struct AccountCreationName: View {
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var firstNameValid: Int = 0
    @State private var lastNameValid: Int = 0

    @State private var activeAlert: invalidNameAlert = .first
    @State private var showingAlert = false

    var body: some View {
        VStack() {
            Image("Ripple Icon")
                .resizable()
                .frame(width: 130.0, height: 130.0)
                .padding(.top, 160)
            Text("What's Your Name?")
                .font(.headline)
                .fontWeight(.bold)
                .offset(x: 0, y: -10)
            HStack() {
                if firstNameValid == 0 {
                    TextFieldWithColoredBorder(color: .white, placeholderText: "First Name", emailOrUsername: $firstName)
                } else if firstNameValid == -1 {
                    TextFieldWithColoredBorder(color: .red, placeholderText: "First Name", emailOrUsername: $firstName)
                } else {
                    TextFieldWithColoredBorder(color: .green, placeholderText: "First Name", emailOrUsername: $firstName)
                }
                if lastNameValid == 0 {
                    TextFieldWithColoredBorder(color: .white, placeholderText: "Last Name", emailOrUsername: $lastName)
                } else if lastNameValid == -1 {
                    TextFieldWithColoredBorder(color: .red, placeholderText: "Last Name", emailOrUsername: $lastName)
                } else {
                    TextFieldWithColoredBorder(color: .green, placeholderText: "Last Name", emailOrUsername: $lastName)
                }

            }
            .offset(x: 0, y: -15)
            NavigationLink(destination: AccountCreationBirthday(), isActive: .constant(self.firstNameValid == 1 && self.lastNameValid == 1)) {
                Button(action: {
                    if self.firstName.count == 0 {
                        self.firstNameValid = -1
                        self.activeAlert = .first
                    } else {
                        self.firstNameValid = 1
                    }
                    if self.lastName.count == 0 {
                        self.lastNameValid = -1
                        if self.firstNameValid == -1 {
                            self.activeAlert = .both
                        } else {
                            self.activeAlert = .last
                        }
                    } else {
                        self.lastNameValid = 1
                    }
                    if self.firstNameValid == -1 || self.lastNameValid == -1 {
                        self.showingAlert.toggle()
                    }
            }) {
                    ContinueText()
                }
            }
            .offset(x: 0, y: -10)
            Spacer()
        }
        .padding(.horizontal, 20)
        .background(RadialGradient(gradient: Gradient(colors: [Color("RippleColorDark"), Color.black]), center: .center, startRadius: 5, endRadius: 300))
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle("Create Account", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .alert(isPresented: $showingAlert) {
            switch activeAlert {
            case .first:
                return Alert(title: Text("Invalid First Name"), message: Text("You must provide a valid first name"), dismissButton: .default(Text("Try Again")))
            case .last:
                return Alert(title: Text("Invalid Last Number"), message: Text("You must provide a valid last name"), dismissButton: .default(Text("Try Again")))
            case .both:
                return Alert(title: Text("Invalid Names"), message: Text("You must provide a valid first and last name"), dismissButton: .default(Text("Try Again")))
            }
        }
    }
    
}

struct AccountCreationName_Previews: PreviewProvider {
    static var previews: some View {
        AccountCreationName()
    }
}
