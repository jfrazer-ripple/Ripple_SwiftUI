//
//  ContentView.swift
//  Ripple_SwiftUI
//
//  Created by justin frazer on 10/24/19.
//  Copyright © 2019 justin frazer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userID: Int = 0
    @State private var screenToDisplay: Int = 0
    
    @ViewBuilder
    var body: some View {
        if userID != 0 { // User has logged in
            LoggedIn(user: getUserWithId(id: userID))
        } else {
            if screenToDisplay == 0 {
                LoginScreen(userID: $userID, screenToDisplay: $screenToDisplay)
            } else if screenToDisplay == 1 {
                AccountCreation(userID: $userID, screenToDisplay: $screenToDisplay)
            } else {
                ForgotPassword()
            }
        }
    }
    
    func getUserWithId(id: Int) -> User  {
        for user in myDataBase.allUsers {
            if (user.id == id) {
                return user
            }
        }
        return myDataBase.allUsers[0]
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(userID: 0)
//    }
//}
