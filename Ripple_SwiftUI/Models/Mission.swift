//
//  Mission.swift
//  Ripple_SwiftUI
//
//  Created by justin frazer on 10/25/19.
//  Copyright © 2019 justin frazer. All rights reserved.
//

import Foundation

class Mission {
    
    let id: Int
    let charityID: Int
    var goalAmount: Int
    var amountRaised: Int
    var description: String
    let startDate: String
    var isFeatured: Bool
    
    init(id: Int, charityReferenceId: Int, goalAmount: Int, description: String, startDate: String) {
        self.id = id
        self.charityID = charityReferenceId
        self.goalAmount = goalAmount
        self.description = description
        self.startDate = startDate
        self.isFeatured = false
        self.amountRaised = Int.random(in: 100000 ... 2000000)
    }

}
