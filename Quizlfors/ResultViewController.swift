//
//  ResultViewController.swift
//  Quizlfors
//
//  Created by 森田貴帆 on 2020/09/17.
//  Copyright © 2020 森田貴帆. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var seikaisuu:Int = 0
    @IBOutlet var kekkalabel:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        kekkalabel.text = String(seikaisuu)
        
    }
    
    @IBAction func back(){
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
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
