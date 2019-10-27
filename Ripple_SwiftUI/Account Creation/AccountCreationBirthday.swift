//
//  AccountCreationBirthday.swift
//  Ripple_SwiftUI
//
//  Created by justin frazer on 10/26/19.
//  Copyright © 2019 justin frazer. All rights reserved.
//

import SwiftUI

struct AccountCreationBirthday: View {
    
    @State private var birthDate = Date()
    @State private var birthdayIsValid: Int = 0

    var body: some View {
        VStack() {
            Image("Ripple Icon")
                .resizable()
                .frame(width: 130.0, height: 130.0)
                .padding(.top, 160)
            Text("When Was Your Birthday?")
                .font(.headline)
                .fontWeight(.bold)
                .offset(x: 0, y: -10)
            DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date) {
                Text("")
            }
            .padding(.leading, 30)
            .padding(.trailing, 30)
            .offset(x: 0, y: -40)
            NavigationLink(destination: AccountCreationBirthday(), isActive: .constant(birthdayIsValid == 1)) {
                Button(action: {
                    print("Foo")
            }) {
                    ContinueText()
                }
            }
            .offset(x: 0, y: -60)
            Spacer()
        }
        .padding(.horizontal, 20)
        .background(RadialGradient(gradient: Gradient(colors: [Color("RippleColorDark"), Color.black]), center: .center, startRadius: 5, endRadius: 300))
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle("Create Account", displayMode: .inline)
    }
}

struct AccountCreationBirthday_Previews: PreviewProvider {
    static var previews: some View {
        AccountCreationBirthday()
    }
}
