//
//  ZoomViewController.swift
//  SlideshowApp
//
//  Created by YushiT on 2016/08/26.
//  Copyright © 2016年 Yushi. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController {
    
    @IBOutlet weak var zoomimage: UIImageView!
    // 受け取るための変数宣言
    var zoomzoomimage:UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        zoomimage.image = zoomzoomimage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
