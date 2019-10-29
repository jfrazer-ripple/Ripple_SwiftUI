//
//  AccountCreation.swift
//  Ripple_SwiftUI
//
//  Created by justin frazer on 10/29/19.
//  Copyright © 2019 justin frazer. All rights reserved.
//

import SwiftUI

struct AccountCreation: View {
    
    @State private var pageToDisplay: Int = 0
        
    @Binding var userID: Int
    @Binding var screenToDisplay: Int
    
    @ViewBuilder
    var body: some View {
        if pageToDisplay == 0 { //Terms and Conditions
            CreateAccountTermsAndConditions(pageToDisplay: $pageToDisplay)
        } else if pageToDisplay == 1 { //Phone Number or Email
            AccountCreationPhoneNumOrEmail(pageToDisplay: $pageToDisplay)
        } else if pageToDisplay == 2 { //Name (first and last)
            AccountCreationName(pageToDisplay: $pageToDisplay)
        }else if pageToDisplay == 3 { //Birthday
            AccountCreationBirthday(pageToDisplay: $pageToDisplay)
        } else if pageToDisplay == 4 { //Create Password
            AccountCreationPasswordCreation(pageToDisplay: $pageToDisplay)
        } else if pageToDisplay == 5 { //Confirm Account
            AccountCreationAccountConfirmation(pageToDisplay: $pageToDisplay)
        } else {
            LoginScreen(showingAlert: true, userID: $userID, screenToDisplay: $screenToDisplay)
        }
    }
}

//struct AccountCreation_Previews: PreviewProvider {
//    static var previews: some View {
//        AccountCreation(pageToDisplay: .constant(0))
//    }
//}
