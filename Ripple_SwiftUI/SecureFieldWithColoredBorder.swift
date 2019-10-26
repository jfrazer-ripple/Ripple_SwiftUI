//
//  SecureFieldWithColoredBorder.swift
//  Ripple_SwiftUI
//
//  Created by justin frazer on 10/25/19.
//  Copyright © 2019 justin frazer. All rights reserved.
//

import SwiftUI

struct SecureFieldWithColoredBorder: View {
    
    var color: Color
    
    @Binding var password: String
    
    var body: some View {
        SecureField("Password", text: $password)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(5)
            .cornerRadius(30)
            .frame(minWidth: 0, maxWidth: .infinity)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                .stroke(color, lineWidth: 2)
            )
    }
}

//struct SecureFieldWithColoredBorder_Previews: PreviewProvider {
//    static var previews: some View {
//        SecureFieldWithColoredBorder(color: .black)
//    }
//}
