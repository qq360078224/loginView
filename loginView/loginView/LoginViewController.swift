//
//  LoginViewController.swift
//  loginView
//
//  Created by XQ on 16/7/11.
//  Copyright © 2016年 XQ. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    let sunImg = UIImageView()
    let cloud1Img = UIImageView()
    let username = UITextField()
    let password = UITextField()
    let login = UIButton(type: .System)

    // 屏幕高度
    let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.height
    // 屏幕宽度
    let SCREEN_WIDTH = UIScreen.mainScreen().bounds.width
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI()
        // Do any additional setup after loading the view.
    }
    func initUI() {
        sunImg.frame = CGRectMake(10, 70, 60, 60)
        sunImg.image = UIImage(named: "sun")
        
        cloud1Img.frame = CGRectMake(120, 90, 80, 80)
        cloud1Img.image = UIImage(named: "cloud")
        
        username.frame = CGRectMake(0, 300, 200, 40)
        username.center = CGPointMake(SCREEN_WIDTH / 2, 300)
        username.background = UIImage(named: "username")
        
        password.frame = CGRectMake(0, 360, 200, 40)
        password.center = CGPointMake(SCREEN_WIDTH / 2, 360)
        password.background = UIImage(named: "password")
        
        login.frame = CGRectMake(0, 460, 100, 40)
        login.center = CGPointMake(SCREEN_WIDTH / 2, 460)
        login.setBackgroundImage(UIImage(named: "btn"), forState: .Normal)
        login.addTarget(self, action: "loginBtn", forControlEvents: .TouchUpInside)
        
        let bgView = UIImageView.init(frame: self.view.frame)
        bgView.userInteractionEnabled = true
        bgView.image = UIImage(named: "bg")
        self.view.addSubview(bgView)
        bgView.addSubview(sunImg)
        bgView.addSubview(cloud1Img)
        bgView.addSubview(username)
        bgView.addSubview(password)
        bgView.addSubview(login)
        
    }
    func loginBtn(){
        print("login")
    }
    
    func aniStart() {
        let rotation = CGAffineTransformMakeRotation(CGFloat(M_PI))
        UIView.animateWithDuration(1) { () -> Void in
            self.sunImg.transform = rotation
        }
        let scale = CGAffineTransformMakeScale(1.5, 1.5)
        UIView.animateWithDuration(1) { () -> Void in
            self.cloud1Img.transform = scale
        }
        
        UIView.animateWithDuration(1) { () -> Void in
            self.username.center.x += self.SCREEN_WIDTH
        }
        UIView.animateWithDuration(1, delay: 0.3, options: .CurveEaseInOut, animations: { () -> Void in
            self.password.center.x += self.SCREEN_WIDTH
            }) { (finished) -> Void in
                self.login.hidden = false
        }
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
       
        username.center.x -= SCREEN_WIDTH
        password.center.x -= SCREEN_WIDTH
        login.hidden = true
    }
    override func viewDidAppear(animated: Bool) {
        self.aniStart()
    }
    
    
    // MARK: - 系统自带
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
