//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by ふるふる on 2019/03/03.
//  Copyright © 2019 Tsuyoshi Furuhata. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell
{

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    // 課題
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var commentLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setPostDate(_ postData: PostData)
    {
        self.postImageView.image = postData.image

        if postData.name != nil || postData.caption != nil
        {
            self.captionLabel.text = "\(postData.name!) : \(postData.caption!)"
        }
        let likeNumber = postData.likes.count
        self.likeLabel.text = "\(likeNumber)"

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        if postData.date != nil
        {
            let dateString = formatter.string(from: postData.date!)
            self.dateLabel.text = dateString
        }
        
        if postData.isLiked
        {
            let buttonImage = UIImage(named: "like_exist")
            self.likeButton.setImage(buttonImage, for: .normal)
        }
        else
        {
            let buttonImage = UIImage(named: "like_none")
            self.likeButton.setImage(buttonImage, for: .normal)
        }
        //課題
        if postData.comment_name != nil && postData.comment != nil
        {
            print("setPostData: \(postData.comment_name!)")
            print("setPostData: \(postData.comment!)")
            self.commentLabel.text = "\(postData.comment_name!): \(postData.comment!)"
        }
        else
        {
            self.commentLabel.text = "コメントなし"
        }

    }
}
