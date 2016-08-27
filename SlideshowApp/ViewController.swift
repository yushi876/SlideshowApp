//
//  ViewController.swift
//  SlideshowApp
//
//  Created by YushiT on 2016/08/25.
//  Copyright © 2016年 Yushi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let photos = ["焼肉.jpg","焼きそば.jpg","ラーメン.jpg"]
    var imageindex = 0
    var timer:NSTimer = NSTimer()
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func next(sender: AnyObject) {
        imageindex += 1
        if imageindex == 3 {
            imageindex = 0
        }
        let image:UIImage! = UIImage(named: photos[imageindex])
        imageView.image = image
    }
    
    @IBAction func back(sender: AnyObject) {
        imageindex -= 1
        if imageindex == -1 {
            imageindex = 2
        }
        let image:UIImage! = UIImage(named: photos[imageindex])
        imageView.image = image
    }
    
    // 再生ボタンを押した時の処理
    @IBAction func resume(sender: AnyObject) {
        // タイマー
        timer = NSTimer.scheduledTimerWithTimeInterval(2.0,
                                                   target: self,
                                                   selector: #selector(ViewController.next(_:)),
                                                   userInfo: nil,
                                                   repeats: true)
    
    }
    
    
    
    // 拡大画面から戻る
    @IBAction func unwind(segue: UIStoryboardSegue) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let image:UIImage! = UIImage(named: photos[imageindex])
        imageView.image = image
    
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

