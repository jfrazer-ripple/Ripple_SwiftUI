//
//  Post.swift
//  Ripple_SwiftUI
//
//  Created by justin frazer on 10/25/19.
//  Copyright © 2019 justin frazer. All rights reserved.
//

import Foundation
import UIKit

class Post {
    var id: Int
    var postOwnerID: Int
    var timeCreated: String
    var postType: Int //1 = Video, 2 = Photo
    var numLikes: Int
    var numShares: Int
    var postDescription: String?
    var postImage: UIImage?
    var videoPath: String?
    
    init(id: Int, postOwnerID: Int, postType: Int, postContent: String?, postImage: UIImage?) {
        
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = DateFormatter.Style.short
        dateformatter.timeStyle = DateFormatter.Style.short
        let now = dateformatter.string(from: Date())
        
        self.id = id
        self.postOwnerID = postOwnerID
        self.postType = postType
        self.timeCreated = now //TODO: determine how to get current time
        self.postDescription = postContent
        self.postImage = postImage
        self.numLikes = 0
        self.numShares = 0
    }
    
    func printPost()  {
        print("#### POST ####")
        print("id: " + String(id))
        print("Post Owner ID: " + String(postOwnerID))
        print("Created: " + timeCreated)
        print("Post Type: " + String(postType))
        print("Likes: " + String(numLikes))
        print("Shares: " + String(numShares))
        
        if let postString = self.postDescription {
            print("Post Description: " + postString)
        }
        
        if let pstImge = self.postImage {
            print(pstImge)
        }
        print("")
    }
}

func getPostWithID(postID: Int) -> Post? {
    for post in myDataBase.allPosts {
        if post.id == postID {
            return post
        }
    }
    return nil
}

