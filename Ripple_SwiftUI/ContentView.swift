//
//  ContentView.swift
//  Ripple_SwiftUI
//
//  Created by justin frazer on 10/24/19.
//  Copyright © 2019 justin frazer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var loggedIn: Bool = false
    
    @ViewBuilder
    var body: some View {
        if loggedIn {
            return HomeScreen()
        } else {
            return LoginScreen()
        }
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
