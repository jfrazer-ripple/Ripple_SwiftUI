//
//  User.swift
//  Ripple_SwiftUI
//
//  Created by justin frazer on 10/25/19.
//  Copyright © 2019 justin frazer. All rights reserved.
//

import Foundation
import UIKit

//Standard User class, a user must be a 'RipplePartner' to receive donations.
class User {
    
    //User Info
    var id: Int
    var firstName: String
    var lastName: String
    var email: String?
    var phoneNumber: String?
    
    // Required for social media linking
    var instagramUsername: String?
    var fbPageId: String?
    var snapchatUsername: String?
    var twitterUsername: String?
    var youtubeChannel: String?
    
    var password: String
    var birthday: String
    var userRedValue: CGFloat
    var userGreenValue: CGFloat
    var userBlueValue: CGFloat
    var isVerified: Bool
    var isRipplePartner: Bool
    var darkStylePreferred: Bool
    
    //User Posts
    var userPhotoPosts: [Int]
    var userVideoPosts: [Int]
    
    // Account variables
    var profilePhoto: UIImage?
    var backgroundPhoto: UIImage?
    var totalLikes: Int
    var totalShares: Int
    var totalDonors: Int
    var rippleScore: Int
    var partnerNPOS: [Int]
    var partnerRipplers: [Int]
    var followers: [Int]
    var followingRipplers: [Int]
    var followingCharities: [Int]
    var followingBusinesses: [Int]
    var causes: [Int]
    var primaryCause: Int
    
    init(id: Int, firstName: String, lastName: String, phoneNumber: String, email: String, password: String, birthday: String, primaryCause: Int, profilePhoto: UIImage?) {
        
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
        self.email = email
        self.password = password
        self.birthday = birthday
        self.primaryCause = primaryCause
        self.profilePhoto = profilePhoto
        
        self.backgroundPhoto = nil
        
        self.instagramUsername = nil
        self.fbPageId = nil
        self.youtubeChannel = nil
        self.snapchatUsername = nil
        self.twitterUsername = nil
        
        self.isVerified = false
        self.isRipplePartner = false
        self.userRedValue = 0
        self.userGreenValue = 0
        self.userBlueValue = 0
        self.totalLikes = 0
        self.totalShares = 0
        self.totalDonors = 0
        self.rippleScore = 0
        self.userPhotoPosts = []
        self.userVideoPosts = []
        self.partnerRipplers = []
        self.partnerNPOS = []
        self.followers = []
        self.followingRipplers = []
        self.followingCharities = []
        self.followingBusinesses = []
        self.causes = []

        self.darkStylePreferred = true
        //userColor: hexStringToUIColor(hex: "008080")
        //DARKS: 000040 - blue, 004000 - green, 400000 - red, 404000 - yellow, 004040 - cyan, 400040 - purple
        //LIGHTS:
        
        //3F7088 - rippleBlue, 6CC6F2 - ?,
    }
    
    func printUser() {
        print("#### User ####")
        print("User ID: " + String(id))
        print("Name: " + firstName + " " + lastName)
        
        if let phnNumber = phoneNumber {
            print("Phone Number: " + phnNumber)
        }
        
        if let emailAddr = email {
            print("Email Addr: " + emailAddr)
        }
        
        print("Birthday: " + birthday)
        print(userPhotoPosts)
        print(userVideoPosts)
        
        if let prfileImage = profilePhoto {
            print(prfileImage)
        }
        
        print("Partner Non-profits: ", terminator:"")
        print(partnerNPOS)
        print("Partner Ripplers: ", terminator:"")
        print(partnerRipplers)
        print("followers: ", terminator:"")
        print(followers)
    }
}

func getUserWithUserNameAndPassword(phoneNumber: String?, password: String?) -> User?  {
    if phoneNumber == "" {
        return myDataBase.allUsers[0]
    }
    
    for user in myDataBase.allUsers {
        if (user.phoneNumber == phoneNumber && user.password == password) || (user.email == phoneNumber && user.password == password) {
            return user
        }
    }
    
    return nil
}

func getUserWithId(id: Int) -> User?  {
    
    for user in myDataBase.allUsers {
        if (user.id == id) {
            return user
        }
    }
    
    return nil
}

func sortUsersByRippleScore(arr: [User]) -> [User] {
    guard arr.count > 1 else { return arr }
    
    let middleIndex = arr.count / 2
    
    let leftArray = sortUsersByRippleScore(arr: Array(arr[0..<middleIndex]))
    let rightArray = sortUsersByRippleScore(arr: Array(arr[middleIndex..<arr.count]))
    
    return mergeByUserRippleScore(leftArray, rightArray)
}

func sortUsersByFollowers(arr: [User]) -> [User] {
    guard arr.count > 1 else { return arr }
    
    let middleIndex = arr.count / 2
    
    let leftArray = sortUsersByFollowers(arr: Array(arr[0..<middleIndex]))
    let rightArray = sortUsersByFollowers(arr: Array(arr[middleIndex..<arr.count]))
    
    return mergeByFollowers(leftArray, rightArray)
}

func sortUsersByDonors(arr: [User]) -> [User] {
    guard arr.count > 1 else { return arr }
    
    let middleIndex = arr.count / 2
    
    let leftArray = sortUsersByDonors(arr: Array(arr[0..<middleIndex]))
    let rightArray = sortUsersByDonors(arr: Array(arr[middleIndex..<arr.count]))
    
    return mergeByDonors(leftArray, rightArray)
}

func sortUsersByTotalLikes(arr: [User]) -> [User] {
    guard arr.count > 1 else { return arr }
    
    let middleIndex = arr.count / 2
    
    let leftArray = sortUsersByTotalLikes(arr: Array(arr[0..<middleIndex]))
    let rightArray = sortUsersByTotalLikes(arr: Array(arr[middleIndex..<arr.count]))
    
    return mergeByTotalLikes(leftArray, rightArray)
}

func mergeByUserRippleScore(_ left: [User], _ right: [User]) -> [User] {
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedArray: [User] = []
    
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

func mergeByFollowers(_ left: [User], _ right: [User]) -> [User] {
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedArray: [User] = []
    
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

func mergeByDonors(_ left: [User], _ right: [User]) -> [User] {
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedArray: [User] = []
    
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

func mergeByTotalLikes(_ left: [User], _ right: [User]) -> [User] {
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedArray: [User] = []
    
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

extension UIViewController {
    func createGradientBackground(userColor: UIColor, darkStylePreferred: Bool, viewToUse: UIView) {
        let gradient = CAGradientLayer()
        gradient.frame = viewToUse.bounds
        
        if darkStylePreferred {
            gradient.colors = [UIColor.black.cgColor, userColor.cgColor, UIColor.black.cgColor]
        } else {
            gradient.colors = [UIColor.white.cgColor, userColor.cgColor, UIColor.white.cgColor]
        }
        
        viewToUse.layer.insertSublayer(gradient, at: 0)
    }
    
    func createAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}

extension Int {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        return numberFormatter.string(from: NSNumber(value:self))!
    }
}

func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

extension UIColor {
    
    func lighter(by percentage: CGFloat = 20.0) -> UIColor? {
        return self.adjust(by: abs(percentage) )
    }
    
    func darker(by percentage: CGFloat = 20.0) -> UIColor? {
        return self.adjust(by: -1 * abs(percentage) )
    }
    
    func adjust(by percentage: CGFloat = 30.0) -> UIColor? {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return UIColor(red: min(red + percentage/100, 1.0),
                           green: min(green + percentage/100, 1.0),
                           blue: min(blue + percentage/100, 1.0),
                           alpha: alpha)
        } else {
            return nil
        }
    }
    
}
