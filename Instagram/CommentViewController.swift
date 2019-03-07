//
//  CommentViewController.swift
//  Instagram
//
//  Created by ふるふる on 2019/03/05.
//  Copyright © 2019 Tsuyoshi Furuhata. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import SVProgressHUD

class CommentViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!

    //コメントボタン押されたセルの情報
    var postData: PostData?
    
    // コメント投稿ボタンをタップした時に呼ばれる
    @IBAction func handleCommentButton(_ sender: Any)
    {
        // PostDataに必要な情報を取得しておく
        let user_name = Auth.auth().currentUser?.displayName
        postData?.comment = textField.text!
        postData?.comment_name = user_name!
        // 辞書を作成してFirebaseに保存する
        let postRef = Database.database().reference().child(Const.PostPath).child(postData!.id!)
        let postDic = ["comment": postData!.comment, "comment_name": postData!.comment_name]
        postRef.updateChildValues(postDic as [AnyHashable : Any])
        
        print("handleCommentButton: \(user_name!)")
        print("handleCommentButton: \(textField.text!)")

        // HUDで投稿完了を表示する
        SVProgressHUD.showSuccess(withStatus: "投稿完了しました")
        
        // 画面を閉じる
        dismiss(animated: true, completion: nil)
    }
    
    // キャンセルボタンをタップした時に呼ばれる
    @IBAction func handleCancelButton(_ sender: Any)
    {
        // 画面を閉じる
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
