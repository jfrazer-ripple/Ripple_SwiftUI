//
//  HomeScreen.swift
//  Ripple_SwiftUI
//
//  Created by justin frazer on 10/24/19.
//  Copyright © 2019 justin frazer. All rights reserved.
//

import SwiftUI

struct HomeScreen: View {
    
    let user: User
    
    var body: some View {
        Text("\(user.email!)")
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen(user: myDataBase.allUsers[0])
    }
}
