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
    var placeholderText: String
    
    @Binding var emailOrUsername: String 
    
    var body: some View {
        TextField(placeholderText, text: $emailOrUsername)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(3)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                .stroke(color, lineWidth: 2)
            )
    }
}

#if DEBUG
struct TextFieldWithColoredBorder_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldWithColoredBorder(color: .black, placeholderText: "", emailOrUsername: .constant(""))
    }
}
#endif
