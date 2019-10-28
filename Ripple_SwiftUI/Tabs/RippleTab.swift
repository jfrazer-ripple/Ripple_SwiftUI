//
//  RippleTab.swift
//  Ripple_SwiftUI
//
//  Created by justin frazer on 10/28/19.
//  Copyright © 2019 justin frazer. All rights reserved.
//

import SwiftUI

struct RippleTab: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Hello Ripple Tab!")
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(RadialGradient(gradient: Gradient(colors: [Color("RippleColorDark"), Color.black]), center: .center, startRadius: 5, endRadius: 300))
        .edgesIgnoringSafeArea(.all)
    }
}

struct RippleTab_Previews: PreviewProvider {
    static var previews: some View {
        RippleTab()
    }
}
