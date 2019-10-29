//
//  CreateAccount.swift
//  Ripple_SwiftUI
//
//  Created by justin frazer on 10/25/19.
//  Copyright © 2019 justin frazer. All rights reserved.
//

import SwiftUI

struct CreateAccountTermsAndConditions: View {
    
    @Binding var pageToDisplay: Int
    
    @ViewBuilder
    var body: some View {
        VStack() {
            Image("Ripple Icon")
                .resizable()
                .frame(width: 130.0, height: 130.0)
                .padding(.top, 160)
            Text("Terms and Conditions")
                .font(.headline)
                .fontWeight(.bold)
                .offset(x: 0, y: -10)
            Text("By hitting the button below, you agree")
                .padding(.top, 30)
            Text("to our ") +
            Text("Ripple Terms")
                .underline()
                .foregroundColor(Color("RippleColor")) +
            Text(" and that")
            Text("you have read our ") +
            Text("Privacy Policy")
                .underline()
                .foregroundColor(Color("RippleColor"))
            Button(action: {
                self.pageToDisplay = 1
            }) {
                ContinueText()
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                .stroke(Color.white, lineWidth: 2)
            )
            .offset(x: 0, y: 40)
            Spacer()
        }
        .padding(.horizontal, 20)
        .background(RadialGradient(gradient: Gradient(colors: [Color("RippleColorDark"), Color.black]), center: .center, startRadius: 5, endRadius: 300))
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle("Terms and Conditions", displayMode: .inline)
    }
}

//struct CreateAccount_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateAccountTermsAndConditions()
//    }
//}
