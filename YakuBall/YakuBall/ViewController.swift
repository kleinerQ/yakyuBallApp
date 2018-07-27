//
//  ViewController.swift
//  YakuBall
//
//  Created by Yen on 2018/7/27.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageViewComputer: UIImageView!
    
    @IBOutlet weak var imageViewPlayer: UIImageView!
    
    @IBAction func reStartBtn(_ sender: Any) {
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.randImage), userInfo: nil, repeats: true)
        
    }
    var gameFlag = false
    var timer:Timer!
    @IBAction func stopBtn(_ sender: Any) {

        
        timer.invalidate()
        
        
        if (self.userRandNum - self.comRandNum) == 1 || (self.userRandNum - self.comRandNum) == -2{
            
            print("user won")
        }else if (self.userRandNum == self.comRandNum){
            
            print("equal")
            
        }else{
            
            print("Computer Won")
        }
        
        
        
        
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
//        imageViewComputer.image = UIImage(named:imageList[ counter % 3 ])
//        imageViewPlayer.image = UIImage(named:imageList[ (counter+1) % 3 ])
//        counter += 1
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.randImage), userInfo: nil, repeats: true)
//        DispatchQueue.global().async {
//
//
//                DispatchQueue.main.async {
//                    self.imageViewComputer.image = UIImage(named:self.imageList[ self.counter % 3 ])
//                }
//
//                //            print(imageList[ counter % 3 ]);
//                //            imageViewPlayer.image = UIImage(named:imageList[ (counter+1) % 3 ])
//
//                self.counter += 1
//                print(self.counter)
//                sleep(1)
//
//        }


        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

