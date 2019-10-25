//
//  Business.swift
//  Ripple_SwiftUI
//
//  Created by justin frazer on 10/25/19.
//  Copyright © 2019 justin frazer. All rights reserved.
//

import Foundation
import UIKit

class Business {
    var id: Int
    var name: String
    var primaryEmail: String
    var isVerified: Bool
    var isRipplePartner: Bool
    var profilePhoto: UIImage?
    var backgroundPhoto: UIImage?
    
    var totalLikes: Int
    var amountDonated: Int
    var rippleScore: Int
    var myPosts: [Int]
    var partnerNPOS: [Int]
    var partnerRipplers: [Int]
    var followers: [Int]
    
    init(id: Int, name: String, primaryEmail: String, profilePhoto: UIImage?, backgroundPhoto: UIImage?, isVerified: Bool) {
        self.id = id
        self.name = name
        self.primaryEmail = primaryEmail
        self.profilePhoto = profilePhoto
        self.backgroundPhoto = backgroundPhoto
        self.isVerified = isVerified
        self.isRipplePartner = true
        self.totalLikes = Int.random(in: 1000 ... 9999)
        self.myPosts = []
        self.partnerRipplers = [1,2,3,4,5]
        self.partnerNPOS = [1,2,3,4]
        self.followers = [2,3,4]
        self.amountDonated = 0
        self.rippleScore = Int.random(in: 80 ... 100)
        
        //DARKS: 000040 - blue, 004000 - green, 400000 - red, 404000 - yellow, 004040 - cyan, 400040 - purple
        //LIGHTS:
        
        //3F7088 - rippleBlue, 6CC6F2 - ?,
    }
}

func getBusinessWithId(id: Int) -> Business?  {
    for business in myDataBase.allBusinesses {
        if (business.id == id) {
            return business
        }
    }
    return nil
}

func sortBusinessesByRippleScore(arr: [Business]) -> [Business] {
    guard arr.count > 1 else { return arr }
    
    let middleIndex = arr.count / 2
    
    let leftArray = sortBusinessesByRippleScore(arr: Array(arr[0..<middleIndex]))
    let rightArray = sortBusinessesByRippleScore(arr: Array(arr[middleIndex..<arr.count]))
    
    return mergeByBusinessRippleScore(leftArray, rightArray)
}

func sortBusinessesByFollowers(arr: [Business]) -> [Business] {
    guard arr.count > 1 else { return arr }
    
    let middleIndex = arr.count / 2
    
    let leftArray = sortBusinessesByFollowers(arr: Array(arr[0..<middleIndex]))
    let rightArray = sortBusinessesByFollowers(arr: Array(arr[middleIndex..<arr.count]))
    
    return mergeByBusinessFollowers(leftArray, rightArray)
}

func sortBusinessesByTotalLikes(arr: [Business]) -> [Business] {
    guard arr.count > 1 else { return arr }
    
    let middleIndex = arr.count / 2
    
    let leftArray = sortBusinessesByTotalLikes(arr: Array(arr[0..<middleIndex]))
    let rightArray = sortBusinessesByTotalLikes(arr: Array(arr[middleIndex..<arr.count]))
    
    return mergeByBusinessTotalLikes(leftArray, rightArray)
}

func mergeByBusinessRippleScore(_ left: [Business], _ right: [Business]) -> [Business] {
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedArray: [Business] = []
    
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        
        if leftElement.rippleScore < rightElement.rippleScore {
            orderedArray.append(leftElement)
            leftIndex += 1
        } else if leftElement.rippleScore > rightElement.rippleScore {
            orderedArray.append(rightElement)
            rightIndex += 1
        } else {
            orderedArray.append(leftElement)
            leftIndex += 1
            orderedArray.append(rightElement)
            rightIndex += 1
        }
    }
    
    while leftIndex < left.count {
        orderedArray.append(left[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < right.count {
        orderedArray.append(right[rightIndex])
        rightIndex += 1
    }
    
    return orderedArray
}

func mergeByBusinessFollowers(_ left: [Business], _ right: [Business]) -> [Business] {
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedArray: [Business] = []
    
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        
        if leftElement.followers.count < rightElement.followers.count {
            orderedArray.append(leftElement)
            leftIndex += 1
        } else if leftElement.followers.count > rightElement.followers.count {
            orderedArray.append(rightElement)
            rightIndex += 1
        } else {
            orderedArray.append(leftElement)
            leftIndex += 1
            orderedArray.append(rightElement)
            rightIndex += 1
        }
    }
    
    while leftIndex < left.count {
        orderedArray.append(left[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < right.count {
        orderedArray.append(right[rightIndex])
        rightIndex += 1
    }
    
    return orderedArray
}

func mergeByBusinessTotalLikes(_ left: [Business], _ right: [Business]) -> [Business] {
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedArray: [Business] = []
    
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        
        if leftElement.totalLikes < rightElement.totalLikes {
            orderedArray.append(leftElement)
            leftIndex += 1
        } else if leftElement.totalLikes > rightElement.totalLikes {
            orderedArray.append(rightElement)
            rightIndex += 1
        } else {
            orderedArray.append(leftElement)
            leftIndex += 1
            orderedArray.append(rightElement)
            rightIndex += 1
        }
    }
    
    while leftIndex < left.count {
        orderedArray.append(left[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < right.count {
        orderedArray.append(right[rightIndex])
        rightIndex += 1
    }
    
    return orderedArray
}

