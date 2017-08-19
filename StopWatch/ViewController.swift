//
//  ViewController.swift
//  StopWatch
//
//  Created by 柳本宗達 on 2017/08/19.
//  Copyright © 2017年 柳本宗達. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var countNum = 0
    var timerRunning = false
    var timer = Timer()
    
    func update(){
        countNum+=1
        let ms = countNum % 100
        let s = (countNum - ms) / 100 % 60
        let m = (countNum - s - ms) / 6000 % 3600
        label.text = String (format: "%02d:%02d.%02d", m,s,ms)
    }
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func start(sender: UIButton) {
        if timerRunning == false{
            timer =
                Timer.scheduledTimer(timeInterval: 0.01,
                                                       target:self,
                                                       selector: #selector(ViewController.update),
                                                       userInfo: nil,
                                                       repeats: true)
            timerRunning = true
        }
        
        
    }
    
    @IBAction func stop(sender: UIButton) {
        if timerRunning == true{
            timer.invalidate()
            timerRunning = false
        }
        
        
    }
    
    @IBAction func reset(sender: UIButton) {
        countNum = 0
        label.text = "00:00.00"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

