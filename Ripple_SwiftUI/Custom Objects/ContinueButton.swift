//
//  ContinueButton.swift
//  Ripple_SwiftUI
//
//  Created by justin frazer on 10/26/19.
//  Copyright © 2019 justin frazer. All rights reserved.
//

import SwiftUI

struct ContinueText: View {
    var body: some View {
        Text("Continue")
            .foregroundColor(.white)
            .padding(5)
            .frame(minWidth: 0, maxWidth: .infinity)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.white, lineWidth: 2)
            )
    }
}

struct ContinueButton_Previews: PreviewProvider {
    static var previews: some View {
        ContinueText()
    }
}
