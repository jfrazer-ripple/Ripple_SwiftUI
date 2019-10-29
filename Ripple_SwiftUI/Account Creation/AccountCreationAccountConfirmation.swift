 //
//  AccountCreationAccountConfirmation.swift
//  Ripple_SwiftUI
//
//  Created by justin frazer on 10/27/19.
//  Copyright © 2019 justin frazer. All rights reserved.
//

import SwiftUI
 
struct AccountCreationAccountConfirmation: View {
    
    @State private var confirmationIsValid: Int = 0
    @State private var confirmationString: String = ""
    @State private var showingAlert = false

    @Binding var pageToDisplay: Int
    
    @ViewBuilder
    var body: some View {
        VStack() {
            Image("Ripple Icon")
                .resizable()
                .frame(width: 130.0, height: 130.0)
                .padding(.top, 160)
            Text("Confirm Your Account")
                .font(.headline)
                .fontWeight(.bold)
                .offset(x: 0, y: -10)
            if self.confirmationIsValid == 0 {
                TextFieldWithColoredBorder(color: .white, placeholderText: "Confirmation Code", emailOrUsername: $confirmationString)
                .offset(x: 0, y: -15)
            } else if self.confirmationIsValid == -1 {
                TextFieldWithColoredBorder(color: .red, placeholderText: "Confirmation Code", emailOrUsername: $confirmationString)
                .offset(x: 0, y: -15)
            } else {
                TextFieldWithColoredBorder(color: .green, placeholderText: "Confirmation Code", emailOrUsername: $confirmationString)
                .offset(x: 0, y: -15)
            }
            Button(action: {
                self.pageToDisplay = 6
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
                return Alert(title: Text("Confirmations Don't Match"), message: Text("The confirmation code you've entered is incorrect"), dismissButton: .default(Text("Try Again")))
        }
    }
}

//struct AccountCreationAccountConfirmation_Previews: PreviewProvider {
//    static var previews: some View {
//        AccountCreationAccountConfirmation()
//    }
//}
