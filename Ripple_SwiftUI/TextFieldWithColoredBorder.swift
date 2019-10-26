//
//  TextFieldWithColoredBorder.swift
//  Ripple_SwiftUI
//
//  Created by justin frazer on 10/25/19.
//  Copyright © 2019 justin frazer. All rights reserved.
//

import SwiftUI

struct TextFieldWithColoredBorder: View {
    
    var color: Color
    
    @Binding var emailOrUsername: String 
    
    var body: some View {
        TextField("Email or Username", text: $emailOrUsername)
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

//struct TextFieldWithColoredBorder_Previews: PreviewProvider {
//    static var previews: some View {
//        TextFieldWithColoredBorder(color: .black, emailOrUsername: emailOrUsername)
//    }
//}
