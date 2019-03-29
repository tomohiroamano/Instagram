//
//  CommentViewController.swift
//  Instagram
//
//  Created by 天野智広 on 2019/03/30.
//  Copyright © 2019 天野智広. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import SVProgressHUD

// 課題：クラス全体　コメント投稿用のビューコントローラーを追加
class CommentViewController: UIViewController {
    
    @IBOutlet weak var Commentbody: UITextField!
    
    // 投稿ボタンをタップしたときに呼ばれるメソッド
    @IBAction func commentPostButton(_ sender: Any) {
        
        // postDataに必要な情報を取得しておく
        let time = Date.timeIntervalSinceReferenceDate
        let name = Auth.auth().currentUser?.displayName
        
        // 辞書を作成してFirebaseに保存する
        let postRef = Database.database().reference().child(Const.PostPath)
        
        // 課題：コメント投稿　コメント、コメント時間、コメントした人の名前(ログイン名)
        let postDic = ["comment": Commentbody.text!, "commenttime": String(time), "commentname": name!]
        postRef.childByAutoId().setValue(postDic)
        
        // HUDで投稿完了を表示する
        SVProgressHUD.showSuccess(withStatus: "コメントを投稿しました")
        
        // 課題：一旦修正せず残す（全てのモーダルを閉じる）
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    // キャンセルボタンをタップしたときに呼ばれるメソッド
    @IBAction func commentCancelButton(_ sender: Any) {
        // 画面を閉じる
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
