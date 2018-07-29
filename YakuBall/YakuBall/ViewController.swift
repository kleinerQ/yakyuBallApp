//
//  ViewController.swift
//  YakuBall
//
//  Created by Yen on 2018/7/27.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var btnStatus = btnStatusList.goGame
    
    @IBOutlet weak var imageViewComputer: UIImageView!
    
    @IBAction func startAndReStartBtn(_ sender: Any) {
        
        if self.btnStatus == .goRetry {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.randImage), userInfo: nil, repeats: true)
            
            
            
            self.btnStatus = .goGame
            self.startAndReStartBtn.setTitle("Stop", for: .normal)
        }else{
            
            timer.invalidate()
            
            
            if (self.userRandNum - self.comRandNum) == 1 || (self.userRandNum - self.comRandNum) == -2{
                
                
                print("user won")
                resultLabel.text = "user won"
            }else if (self.userRandNum == self.comRandNum){
                
                resultLabel.text = "equal"
                print("equal")
                
            }else{
                resultLabel.text = "Computer Won"
                print("Computer Won")
            }
            
            self.btnStatus = .goRetry
            self.startAndReStartBtn.setTitle("Start", for: .normal)
            
        }
    }
    @IBOutlet weak var startAndReStartBtn: UIButton!
    @IBOutlet weak var imageViewPlayer: UIImageView!
    
    @IBOutlet weak var resultLabel: UILabel!

    var gameFlag = false
    var timer:Timer!

    
    
    enum btnStatusList {
        case goRetry
        case goGame
        
    }

    
    var comRandNum = Int()
    var userRandNum = Int()
    
    
    @objc func randImage(){
        comRandNum = Int(arc4random_uniform(3))
        userRandNum = Int(arc4random_uniform(3))

        imageViewComputer.image = UIImage(named:imageList[ comRandNum ])
        imageViewPlayer.image = UIImage(named:imageList[ userRandNum ])
        
    }
    let imageList = ["sci.png","stone.png","pap.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.randImage), userInfo: nil, repeats: true)
        self.startAndReStartBtn.setTitle("Stop", for: .normal)
        resultLabel.text = "Result"



        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

