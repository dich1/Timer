//
//  ViewController.swift
//  Timer
//
//  Created by 伊藤 大智 on 2017/01/22.
//  Copyright © 2017年 daichi.itoh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    
    // タイマークラスを生成
    var timer: Timer!
    // 時間を扱う変数を用意
    var timer_section: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
     * 0.1秒毎にラベルを切り替える
     * @param timer
     */
    func updateTimer(timer: Timer) {
        self.timer_section += 0.1
        self.timerLabel.text = String(format: "%.1f", timer_section)
        
    }
    
    /**
     * タイマーの始動
     * @param Any
     */
    @IBAction func startTimer(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    }

    /**
     * タイマーの停止
     * @param Any
     */
    @IBAction func pauseTimer(_ sender: Any) {
        // nilチェック
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
        }
    }

    /**
     * タイマーを0に戻す
     * @param Any
     */
    @IBAction func resetTimer(_ sender: Any) {
        self.timer_section = 0
        self.timerLabel.text = String(format: "%.1f", self.timer_section)
        
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
        }
    }
    
}

