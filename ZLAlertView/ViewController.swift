//
//  ViewController.swift
//  ZLAlertView
//
//  Created by 赵乐 on 2017/2/21.
//  Copyright © 2017年 zhaole. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func openAlertView1(_ sender: UIButton) {
        let alert =  ZLAlertView()
        alert.push("操作成功", .normal)
    }
    
    @IBAction func openAlertView2(_ sender: UIButton) {
        let alert = ZLAlertView()
        let color = UIColor (red: 151/255.0, green: 151/255.0, blue: 151/255.0, alpha: 1.0)
        alert.push("这是自定义的颜色",color , UIColor.black)
    }
}

