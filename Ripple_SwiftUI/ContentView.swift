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
    
    @ViewBuilder
    var body: some View {
        if userID != 0 {
            HomeScreen(user: getUserWithId(id: userID))
        } else {
            LoginScreen(userID: $userID)
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

struct DetailView: View {
    var body: some View {
        Text("This is the detail view")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
