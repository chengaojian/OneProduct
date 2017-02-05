//
//  HomePageViewController.swift
//  OneProduct
//
//  Created by Mac on 2017/2/5.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

// tag的累积值
let BtnTag: NSInteger = 100
// TabBar高度
let TabBarH: CGFloat = 66.5
// TabBar宽度
let TabBarW = SCREEN_WIDTH / 5.0

class HomePageViewController: UITabBarController {

    // 自定义TabBar背景图
    lazy var tabBarBGImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "tabbar_bg")
        img.frame = CGRect(x: 0, y: SCREEN_HEIGHT - TabBarH, width: SCREEN_WIDTH, height: TabBarH)
        img.isUserInteractionEnabled = true
        return img;
    }()
    
    // 默认情况下图标
    lazy var normalImageArr: [UIImage] = {
        var tempArr: [UIImage] = [UIImage]()
        tempArr.append(UIImage(named: "tab_main_nor")!)
        tempArr.append(UIImage(named: "tab_mine_nor")!)
        tempArr.append(UIImage(named: "tab_camera_nor")!)
        tempArr.append(UIImage(named: "tab_schedule_nor")!)
        tempArr.append(UIImage(named: "tab_shopCar_nor")!)
        return tempArr
    }()
    
    // 选中情况下图标
    lazy var highImageArr: [UIImage] = {
        var tempArr: [UIImage] = [UIImage]()
        tempArr.append(UIImage(named: "tab_main_sel")!)
        tempArr.append(UIImage(named: "tab_mine_sel")!)
        tempArr.append(UIImage(named: "tab_camera_sel")!)
        tempArr.append(UIImage(named: "tab_schedule_sel")!)
        tempArr.append(UIImage(named: "tab_shopCar_sel")!)
        return tempArr
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        createCustomTabBar()
        setupView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupView() {
        
        view.backgroundColor = .white
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// 初始化
extension HomePageViewController {
    
    // 创建自定义TabBar
    func createCustomTabBar() {
        
        // 隐藏系统TabBar
        tabBar.isHidden = true
        // 添加TabBar背景图片
        view.addSubview(tabBarBGImageView)
        
        // 创建TabBarItems
        for index in 0..<5 {
            let tabBarBtn = UIButton(type: .custom)
            if index == 2 {
                tabBarBtn.frame = CGRect(x: TabBarW * CGFloat(index), y: 0, width: TabBarW, height: TabBarH)
            }else{
                tabBarBtn.frame = CGRect(x: TabBarW * CGFloat(index), y: 0, width: TabBarW, height: TabBarH)
            }
            tabBarBtn.tag = BtnTag + index
//            tabBarBtn.backgroundColor = .red
            tabBarBtn.adjustsImageWhenDisabled = false
            tabBarBtn.setImage(normalImageArr[index], for: .normal)
            tabBarBtn.setImage(highImageArr[index], for: .highlighted)
            tabBarBGImageView.addSubview(tabBarBtn)
        }
        
    }
}

extension HomePageViewController: UINavigationControllerDelegate {
    
    
}

