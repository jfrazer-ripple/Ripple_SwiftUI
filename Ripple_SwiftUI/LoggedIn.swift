//
//  HomeScreen.swift
//  Ripple_SwiftUI
//
//  Created by justin frazer on 10/24/19.
//  Copyright © 2019 justin frazer. All rights reserved.
//

import SwiftUI

struct LoggedIn: View {
    
    @EnvironmentObject var nav: NavigationController
    
    let user: User
    
    var body: some View {
        TabView(selection: self.$nav.selection){
            
            NewsFeedTab() //(navController: $navController)
                .font(.title)
                .tabItem {
                    VStack {
                        Image("BlackNewsFeedTab")
                        Text("Feed")
                    }
                }
                .tag(0)
            
            VolunteerTab() //(navController: $navController)
                .font(.title)
                .tabItem {
                    VStack {
                        Image("BlackVolunteerTab")
                        Text("Volunteer")
                    }
                }
                .tag(1)
            
            RippleTab()
                .font(.title)
                .tabItem {
                    VStack {
                        Image("BlackRippleTab")
                         Text("Ripple")
                    }
                }
                .tag(2)
            RankingsTab()
                .font(.title)
                .tabItem {
                    VStack {
                        Image("BlackRankingsTab")
                         Text("Rankings")
                    }
                }
                .tag(3)
            MyAccountTab()
                .font(.title)
                .tabItem {
                    VStack {
                        Image("BlackMyAccountTab")
                         Text("My Account")
                    }
                }
                .tag(4)
        }
    }
}

struct LoggedIn_Previews: PreviewProvider {
    static var previews: some View {
        LoggedIn(user: myDataBase.allUsers[0])
    }
}
