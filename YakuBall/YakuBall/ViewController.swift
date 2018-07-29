//
//  ViewController.swift
//  YakuBall
//
//  Created by Yen on 2018/7/27.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imageNameList = [UIImageView]()
    var counter = 0
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    
    @IBOutlet weak var image8: UIImageView!
    @IBOutlet weak var image9: UIImageView!
    @IBOutlet weak var image7: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image1: UIImageView!
    var btnStatus = btnStatusList.goGame
    let alphaStep:CGFloat = 0.1
    var alphaValueCurrent:CGFloat =  0
    @IBOutlet weak var imageViewComputer: UIImageView!
    
    @IBAction func startAndReStartBtn(_ sender: Any) {
        
        if self.btnStatus == .goRetry {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.randImage), userInfo: nil, repeats: true)
            
            
            
            self.btnStatus = .goGame
            self.startAndReStartBtn.setTitle("Stop", for: .normal)
        }else{
            
            timer.invalidate()
            
            
            if (self.userRandNum - self.comRandNum) == 1 || (self.userRandNum - self.comRandNum) == -2{
                
                alphaValueCurrent += alphaStep
                print("user won")
                resultLabel.text = "user won"
                //image1.alpha += alphaStep
                if counter == 9 {
                    counter = 0
                    alphaValueCurrent = 0
                    
                    for image in imageNameList{
                        image.alpha = 0
                        
                    }
                }
                for imageIndex in 0 ... counter {
                    imageNameList[imageIndex].alpha = alphaValueCurrent
                    
                }
                imageViewComputer.alpha = 1 - alphaValueCurrent
                imageViewPlayer.alpha = 1 - alphaValueCurrent
                imageNameList[counter].isHidden = false
                counter += 1
                if counter == 9 {
                    for image in imageNameList{
                        image.alpha = 1
                    }
                    imageViewComputer.alpha = 0
                    imageViewPlayer.alpha = 0
                }
                
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

        imageNameList = [image1,image2,image3,image4,image5,image6,image7,image8,image9]

        for image in imageNameList{
            image.alpha = 0

        }
//        image1.alpha = 0
//        image2.alpha = 0
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

