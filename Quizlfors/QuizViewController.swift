//
//  QuizViewController.swift
//  Quizlfors
//
//  Created by 森田貴帆 on 2020/09/17.
//  Copyright © 2020 森田貴帆. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    var quizArray = [Any]()
    var seikaisuu: Int = 0
    
    @IBOutlet var questiontextview: UITextView!
    
    @IBOutlet var choicebutton1:UIButton!
    @IBOutlet var choicebutton2:UIButton!
    @IBOutlet var choicebutton3:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        quizArray.append(["君の〇〇のその香水のせいだよ","ドルチェアンドガッパーナ","カルバンクライン","ルイヴィトン",1])
        quizArray.append(["香水を開封してからの使用期限はどれくらいでしょうか","1年","2年","3年",1])
        quizArray.append(["香水のつけた瞬間の香をなんというでしょう","ファーストノート","トップフレグランス","トップノート",3])
        quizArray.append(["ユニセックスの香水が人気のAesop、なんと読むでしょう","アエソプ","イソップ","イソプ",2])
        
        quizArray.shuffle()
        choicequiz()
      

        // Do any additional setup after loading the view.
    }
    
    func choicequiz(){
        //一時的にクイズを取り出しておく配列
        let tmpArray = quizArray[0] as! [Any]
        //問題文を表示
        questiontextview.text = tmpArray[0] as? String
        
        choicebutton1.setTitle(tmpArray[1] as? String, for: .normal)
        choicebutton2.setTitle(tmpArray[2] as? String, for: .normal)
        choicebutton3.setTitle(tmpArray[3] as? String, for: .normal)
    }
    
    func performSegueToResult(){
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    @IBAction func choiceAnswer(sender:UIButton){
        let tmpArray = quizArray[0] as! [Any]
        if tmpArray[4] as! Int == sender.tag{//クイズの正解番号とTagを比べる
            seikaisuu = seikaisuu + 1
        
        }
        //解いた問題を配列から取り除く
        quizArray.remove(at: 0)
        //解いた問題数の合計があらかじめ設定しておいた数に達したら、つまり配列にもうクイズが無くなったら画面遷移
        if quizArray.count == 0{
            performSegueToResult()
        }else{
            choicequiz()
        }
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultView"{
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.seikaisuu = self.seikaisuu
        }
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
