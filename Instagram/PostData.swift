//
//  PostData.swift
//  Instagram
//
//  Created by 天野智広 on 2019/03/28.
//  Copyright © 2019 天野智広. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class PostData: NSObject {
    var id: String?
    var image: UIImage?
    var imageString: String?
    var name: String?
    var caption: String?
    var date: Date?
    var likes: [String] = []
    var isLiked: Bool = false
    
    // 課題：コメントそのもの、コメントした人、複数人が複数コメント投稿可能にした
    var comment: [String] = []
    var commentname: [String] = []
    
    init(snapshot: DataSnapshot, myId: String) {
        self.id = snapshot.key
        
        let valueDictionary = snapshot.value as! [String: Any]
        
        imageString = valueDictionary["image"] as? String
        image = UIImage(data: Data(base64Encoded: imageString!, options: .ignoreUnknownCharacters)!)
        
        self.name = valueDictionary["name"] as? String
        
        self.caption = valueDictionary["caption"] as? String
        
        let time = valueDictionary["time"] as? String
        self.date = Date(timeIntervalSinceReferenceDate: TimeInterval(time!)!)
        
        // 課題：コメントに関するキーを追加
        if let comment = valueDictionary["comment"] as? [String] {
            self.comment = comment
        }

        if let commentname = valueDictionary["commentname"] as? [String] {
            self.commentname = commentname
        }
        
        if let likes = valueDictionary["likes"] as? [String] {
            self.likes = likes
        }
        
        for likeId in self.likes {
            if likeId == myId {
                self.isLiked = true
                break
            }
        }
    }
}
