//
//  SecondViewController.swift
//  WQGCDTimer
//
//  Created by chenweiqiang on 2020/5/17.
//  Copyright © 2020 chenweiqiang. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var task: String!
    
    var timer: Timer!
    deinit {
        print("SecondViewController deinit")
//        self.timer.invalidate()
    }
    override func viewDidDisappear(_ animated: Bool) {
        WQGCDTimer.cancelTask(self.task)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        let btn = UIButton(frame: CGRect(x: 100, y: 200, width: 100, height: 40))
        btn.setTitle("停止Timer", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(stopClick), for: .touchUpInside)
        self.view.addSubview(btn)
        
        let target = WQProxy(target: self)
        self.task = WQGCDTimer.execTask(target, selector: #selector(dotask), start: 1.00, interval: 4.0, repeats: true, async: true)
//        self.task = WQGCDTimer.execTask(self, selector: #selector(dotask), start: 0, interval: 1.0, repeats: true, async: true)
        
//        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: target, selector: #selector(dotask), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }
    @objc func dotask() {
        print("dotask \(Thread.current)")
    }
    @objc func stopClick() {
        WQGCDTimer.cancelTask(self.task)
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
