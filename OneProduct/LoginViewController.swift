//
//  LoginViewController.swift
//  OneProduct
//
//  Created by Mac on 2017/2/4.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit
import AVKit
import MediaPlayer

let loginBtnRect = CGRect(x: 30, y: SCREEN_HEIGHT - 150, width: SCREEN_WIDTH - 60, height: 50)
let regisBtnRect = CGRect(x: 30, y: SCREEN_HEIGHT - 75, width: SCREEN_WIDTH - 60, height: 50)

class LoginViewController: UIViewController {
    
    // 视频播放VC
    let playerVC = AVPlayerViewController()
    
    // 登录、注册
    let loginBtn = UIButton(frame: loginBtnRect)
    let regisBtn = UIButton(frame: regisBtnRect)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 创建登录注册按钮
        setupView()
        // 创建播放控制器
        setupPlayerVC()
    }
    
    func setupView() {
        
        view.backgroundColor = .clear
        
        loginBtn.customUIButton(title: "登录")
        regisBtn.customUIButton(title: "注册")
        
        // 添加相应事件
        loginBtn.addTarget(self, action: #selector(loginBtnClick), for: .touchUpInside)
        regisBtn.addTarget(self, action: #selector(regisBtnClick), for: .touchUpInside)
//        loginBtn.addTarget(self, action: #selector(buttonTap(_:)), for: .touchUpInside)
//        regisBtn.addTarget(self, action: #selector(buttonTap(_:)), for: .touchUpInside)
        
        view.addSubview(loginBtn)
        view.addSubview(regisBtn)
    }
    
//    func buttonTap(_ sender: UIButton) {
//        print("点击的按钮："+sender.currentTitle!)
//    }
    
    func loginBtnClick() {
     
        print("点击了登录按钮")
        self.present(HomePageViewController(), animated: true, completion: nil)
    }
    
    func regisBtnClick() {
        
        print("点击了注册按钮")
    }
    
    func setupPlayerVC() {
        
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "mv", ofType: "mp4")!)
        // 播放指定视频
        playerVC.player = AVPlayer(url: url);
        // 是否显示工具栏
        playerVC.showsPlaybackControls = false
        // 视频画面显示方式
        playerVC.videoGravity = AVLayerVideoGravityResizeAspectFill
        // 播放器位置
        playerVC.view.frame = Rect
        // 透明度
        playerVC.view.alpha = 0
        
        //监听视频播放完的状态
        NotificationCenter.default.addObserver(self, selector: #selector(repeatPlay), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerVC.player?.currentItem)
        
        // 播放器添加到View上
        view.addSubview(playerVC.view)
        view.sendSubview(toBack: playerVC.view)
        // 开始播放
        UIView.animate(withDuration: 1.0){
            self.playerVC.view.alpha = 1
            self.playerVC.player?.play()
        }
    }
    
    //回到起点，重新播放
    func repeatPlay() {
        playerVC.player?.seek(to: kCMTimeZero)
        playerVC.player?.play()
    }
}
