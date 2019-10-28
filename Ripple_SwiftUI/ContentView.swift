//
//  ContentView.swift
//  Ripple_SwiftUI
//
//  Created by justin frazer on 10/24/19.
//  Copyright © 2019 justin frazer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var userID: Int = 0
    @State var screenToPresent: Int = 0
    
    @ViewBuilder
    var body: some View {
        if userID != 0 { // User has logged in
            LoggedIn(user: getUserWithId(id: userID))
        } else {
            if screenToPresent == 0 { // Default Login Screen
                LoginScreen(userID: $userID)
            } else if screenToPresent == 1 { // Account Creation Flow
                LoginScreen(userID: $userID)
            } else { // Forgot Password Flow
                LoginScreen(userID: $userID)
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
