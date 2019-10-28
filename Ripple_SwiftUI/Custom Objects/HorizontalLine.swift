//
//  HorizontalLineWithShadow.swift
//  Ripple_SwiftUI
//
//  Created by justin frazer on 10/28/19.
//  Copyright © 2019 justin frazer. All rights reserved.
//

import SwiftUI

struct HorizontalLine: View {
    
    @State private var shadowColor: Color = .black
    
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: 10))
            path.addLine(to: CGPoint(x: 1000, y: 10))
            path.addLine(to: CGPoint(x: 1000, y: 0))
        }
        .fill(Color.black)
    }
    
}

struct HorizontalLine_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalLine()
    }
}
