//
//  ViewController.swift
//  Learning_SwiftAnimation
//
//  Created by Little Poy on 10/2/2563 BE.
//  Copyright © 2563 littlepoy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var imageView: UIImageView!
    var currentAnimation = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView = UIImageView(image: UIImage(named: "blue_star"))
        imageView.center = CGPoint(x: 512, y: 384) //for ipad only
        view.addSubview(imageView)
    }
    
    @IBAction func tabAction(_ sender: UIButton) {
        sender.isHidden = true
        
        //UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
        //usingSpringWithDamping 0-1 : น้อยอ่อน มากแข็ง
        //initialSpringVelocity : ค.เร็ว อนิเมชั่นสปริง 0-1
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
            
            switch self.currentAnimation {
            case 0:
                self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
                break
            case 1:
                self.imageView.transform = .identity //reset to default
            case 2:
                self.imageView.transform = CGAffineTransform(translationX: -256, y: -100)
                //x <- (-) | (+) ->
            //y ^ (-) | (+) v
            case 3:
                self.imageView.transform = .identity //reset to default
            case 4:
                //Core Animation will always take the shortest route to make the rotation work.
                //if you try to rotate 360 degrees (radians: pi times 2), Core Animation will calculate the shortest rotation to be "just don't move, because we're already there."
                //https://cf2024f4-a-62cb3a1a-s-sites.googlegroups.com/site/trigonometricfunctionssmtcc/home/%E0%B8%AB%E0%B8%99%E0%B9%89%E0%B8%B2%E0%B9%81%E0%B8%A3%E0%B8%81p1.gif?attachauth=ANoY7cq-6LL52lasoDvPHQddCp6rn4avzTfdF_QKyf8pQfvMS7ar9ZY0LRb_Z96Fsb2SmCsLUjERegBaJB8lVBGqcpsEejYDt8zkP1JNzwACn1ipwtnZhugg6QUSazCyhjz2Q-nwASbKutUWDAP9SpDuDqBSLhqFTYsv83DRmH5FQ6wudxVjc0vJB5WNRH9Sc7zHwgsXszmyv-9wdmgQuqA-I5yD1sc4DtywZevk6OpaYam1v815w-nJIW_X-P7LS8bA5W-CrBd46b9TVzaJplMA7u6l-dt-TAMtQB6fqehkxFoBEHMb35IEJMRMO_NOrRI0sHxjdnWY&attredirects=0
                //ตรีโกณมิติวงกลม
                self.imageView.transform = CGAffineTransform(rotationAngle:  CGFloat(.pi * 2.0))
                self.imageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi) //radain
            case 5:
                self.imageView.transform = .identity
            case 6:
                self.imageView.alpha = 0.1
                self.imageView.backgroundColor = UIColor.green
                
            case 7:
                self.imageView.alpha = 1
                self.imageView.backgroundColor = UIColor.clear
            default:
                break
            }
        }) { finished in
            sender.isHidden = false
        }
        
        currentAnimation += 1
        
        if currentAnimation > 7 {
            currentAnimation = 0
        }
    }
    
}

