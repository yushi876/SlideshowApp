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
    
    @IBOutlet weak var nextOutlet: UIButton!
    @IBAction func next(sender: AnyObject) {
        imageindex += 1
        if imageindex == 3 {
            imageindex = 0
        }
        let image:UIImage! = UIImage(named: photos[imageindex])
        imageView.image = image
    }
    
    
    @IBOutlet weak var backOutlet: UIButton!
    @IBAction func back(sender: AnyObject) {
        imageindex -= 1
        if imageindex == -1 {
            imageindex = 2
        }
        let image:UIImage! = UIImage(named: photos[imageindex])
        imageView.image = image
        
    }
    
    // 再生ボタンを押した時の処理
    @IBOutlet weak var resumeOutlet: UIButton!
    @IBAction func resume(sender: AnyObject) {
        if nextOutlet.enabled == true {
            // タイマー
            timer = NSTimer.scheduledTimerWithTimeInterval(2.0,
                                                           target: self,
                                                           selector: #selector(ViewController.next(_:)),
                                                           userInfo: nil,
                                                           repeats: true)
            // 一度押したら、「停止」ボタンが表示
            resumeOutlet.setTitle("停止", forState: UIControlState.Normal)
            // 進む・戻るボタンを無効にする
            nextOutlet.enabled = false
            backOutlet.enabled = false
        } else {
            timer.invalidate()
            resumeOutlet.setTitle("再生", forState: UIControlState.Normal)
            nextOutlet.enabled = true
            backOutlet.enabled = true
        }
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
    
    // 画面遷移
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        let zoomViewController:ZoomViewController = segue.destinationViewController as! ZoomViewController
        zoomViewController.zoomzoomimage = imageView.image!
        
        timer.invalidate()
        resumeOutlet.setTitle("再生", forState: UIControlState.Normal)
        nextOutlet.enabled = true
        backOutlet.enabled = true
        
    }
    
    // 拡大画面から戻る
    func unwind(segue: UIStoryboardSegue) {
    }
    
    
}

