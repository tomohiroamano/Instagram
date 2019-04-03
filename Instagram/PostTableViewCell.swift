//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by 天野智広 on 2019/03/22.
//  Copyright © 2019 天野智広. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    
    //課題：コメントボタン、コメントのオブジェクト追加
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var commentBody: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setPostData(_ postData: PostData) {
        self.postImageView.image = postData.image
        
        self.captionLabel.text = "\(postData.name!) : \(postData.caption!)"
        let likeNumber = postData.likes.count
        likeLabel.text = "\(likeNumber)"
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let dateString = formatter.string(from: postData.date!)
        self.dateLabel.text = dateString
        
        // 課題：PostData オブジェクト (インスタンス) の内容をセル内のオブジェクトに反映
        // 課題：配列の中身をUILABELに表示させるように修正
        var commentText = ""
        let count = postData.comment.count
        
        for i in 0..<count {
            let comment = postData.comment[i]
            let name = postData.commentname[i]
            commentText += name + ": " + comment + "\n"
            self.commentBody.text = commentText
            //self.commentBody.text = "\(postData.commentname) : \(postData.comment)"
        }
        
        if postData.isLiked {
            let buttonImage = UIImage(named: "like_exist")
            self.likeButton.setImage(buttonImage, for: .normal)
        } else {
            let buttonImage = UIImage(named: "like_none")
            self.likeButton.setImage(buttonImage, for: .normal)
        }
    }
}
