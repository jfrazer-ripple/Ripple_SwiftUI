//
//  Charity.swift
//  Ripple_SwiftUI
//
//  Created by justin frazer on 10/25/19.
//  Copyright © 2019 justin frazer. All rights reserved.
//

import Foundation
import UIKit
/*
 Charitable Categories:
 Education (1)
 - Early Childhood Programs and Services (1)
 - Scholarship and Financial Support (2)
 - Special Education (3)
 - Adult Education Programs and Services (4)
 - Youth Education Programs and Services (5)
 - Educations Policy and Reform (6)
 
 Environment (2)
 - Environmental Protection and Conservation (1)
 - Botanical Gardens, Parks, and Nature Centers (2)
 
 Health (3)
 - Diseases, Disorders, and Disciplines (1)
 - Patient and Family Support (2)
 - Treatment and Prevention Services (3)
 - Medical Research (4)
 
 Community Development (4)
 - United Ways (1)
 - Jewish Federations (2)
 - Community Foundations (3)
 - Housing and Neighborhood Developments (4)
 
 Human Services (5)
 - Children's and Family Services (1)
 - Youth Development, Shelter, and Crisis Services (2)
 - Food Banks, Food Pantires, and Food Distribution (3)
 - Multipurpose Human Service Organizations (4)
 - Homeless Services (5)
 - Social Services (6)
 
 International (6)
 - Development and Releif Services (1)
 - Internation Peace, Security, and Affairs (2)
 - Humanitarian Releif Support (3)
 
 Animals (7)
 - Animal Rights, Welfare, and Services (1)
 - Wildlife Conservation (2)
 - Zoos and Aquariums (3)
 */

class Charity {
    var id: Int
    var charityName: String
    var address: String
    var zipCode: Int
    var isVerified: Bool
    var isRipplePartner: Bool
    var rippleScore: Int
    var profilePhoto: UIImage?
    var backgroundPhoto: UIImage?
    var cause: Int
    var subCategory: Int
    
    var myPosts: [Int]
    
    var totalLikes: Int
    var totalDonors: Int
    var partnerNPOS: [Int]
    var partnerRipplers: [Int]
    var followers: [Int]
    
    init(id: Int, charityName: String, profilePhoto: UIImage?, backgroundPhoto: UIImage?, cause: Int, subCategory: Int, isVerified: Bool, address: String, zipCode: Int) {
        self.id = id
        self.charityName = charityName
        self.profilePhoto = profilePhoto
        self.backgroundPhoto = backgroundPhoto
        self.cause = cause
        self.subCategory = subCategory
        self.totalLikes = Int.random(in: 1000 ... 9999)
        self.totalDonors = Int.random(in: 50 ... 1000)
        self.myPosts = []
        self.partnerRipplers = [1,2,3,4,5]
        self.partnerNPOS = [1,2,3,4]
        self.followers = [2,3,4]
        self.isVerified = isVerified
        self.address = address
        self.zipCode = zipCode
        if Int.random(in: 1 ... 10) < 6 {
            self.isRipplePartner = true
        } else {
            self.isRipplePartner = false
        }
        self.rippleScore = Int.random(in: 50 ... 100)
        //DARKS: 000040 - blue, 004000 - green, 400000 - red, 404000 - yellow, 004040 - cyan, 400040 - purple
        //LIGHTS:
        
        //3F7088 - rippleBlue, 6CC6F2 - ?,
    }
    
    func printCharity() {
        print("#### Charity ####")
        print("Charity ID: " + String(id))
        print("Name: " + charityName)
        print("Total Likes: " + String(totalLikes))
        print("Charity Posts: ", terminator:"")
        print(myPosts)
        print("Followers: ", terminator:"")
        print(followers)
        print("Cause: ", terminator:"")
        print(cause)
        print("subCategory: ", terminator:"")
        print(subCategory)
        print("Partner Non-profits: ", terminator:"")
        print(partnerNPOS)
        print("Partner Ripplers: ", terminator:"")
        print(partnerRipplers)
        print("followers: ", terminator:"")
        print(followers)
        print("rippleScore: ", terminator:"")
        print(rippleScore)
    }
}

func getCharityWithId(id: Int) -> Charity?  {
    
    for charity in myDataBase.allCharities {
        if (charity.id == id) {
            return charity
        }
    }
    
    return nil
}

func sortCharitiesByRippleScore(arr: [Charity]) -> [Charity] {
    guard arr.count > 1 else { return arr }
    
    let middleIndex = arr.count / 2
    
    let leftArray = sortCharitiesByRippleScore(arr: Array(arr[0..<middleIndex]))
    let rightArray = sortCharitiesByRippleScore(arr: Array(arr[middleIndex..<arr.count]))
    
    return mergeByCharityRippleScore(leftArray, rightArray)
}

func mergeByCharityRippleScore(_ left: [Charity], _ right: [Charity]) -> [Charity] {
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedArray: [Charity] = []
    
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

func sortCharitiesByDonors(arr: [Charity]) -> [Charity] {
    guard arr.count > 1 else { return arr }
    
    let middleIndex = arr.count / 2
    
    let leftArray = sortCharitiesByDonors(arr: Array(arr[0..<middleIndex]))
    let rightArray = sortCharitiesByDonors(arr: Array(arr[middleIndex..<arr.count]))
    
    return mergeByCharityDonors(leftArray, rightArray)
}

func mergeByCharityDonors(_ left: [Charity], _ right: [Charity]) -> [Charity] {
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedArray: [Charity] = []
    
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        
        if leftElement.totalDonors < rightElement.totalDonors {
            orderedArray.append(leftElement)
            leftIndex += 1
        } else if leftElement.totalDonors > rightElement.totalDonors {
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

func sortCharitiesByFollowers(arr: [Charity]) -> [Charity] {
    guard arr.count > 1 else { return arr }
    
    let middleIndex = arr.count / 2
    
    let leftArray = sortCharitiesByFollowers(arr: Array(arr[0..<middleIndex]))
    let rightArray = sortCharitiesByFollowers(arr: Array(arr[middleIndex..<arr.count]))
    
    return mergeByCharityFollowers(leftArray, rightArray)
}

func mergeByCharityFollowers(_ left: [Charity], _ right: [Charity]) -> [Charity] {
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedArray: [Charity] = []
    
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

func sortCharitiesByTotalLikes(arr: [Charity]) -> [Charity] {
    guard arr.count > 1 else { return arr }
    
    let middleIndex = arr.count / 2
    
    let leftArray = sortCharitiesByTotalLikes(arr: Array(arr[0..<middleIndex]))
    let rightArray = sortCharitiesByTotalLikes(arr: Array(arr[middleIndex..<arr.count]))
    
    return mergeByCharityTotalLikes(leftArray, rightArray)
}

func mergeByCharityTotalLikes(_ left: [Charity], _ right: [Charity]) -> [Charity] {
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedArray: [Charity] = []
    
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
