//
//  ViewController.swift
//  OneProduct
//
//  Created by Mac on 2017/2/4.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIScrollViewDelegate{
    
    let scrollView = UIScrollView(frame: Rect)
    let images = ["first","second","three"]
    let pageControl = UIPageControl(frame: CGRect(x: 0, y: SCREEN_HEIGHT - 30, width: SCREEN_WIDTH, height: 20))
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView();
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setupView() {
    
        // 设置背景颜色
        view.backgroundColor = .red
        for (index, value) in images.enumerated() {
            let imageView = UIImageView(frame: CGRect(x: SCREEN_WIDTH * CGFloat(index), y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
            imageView.image = UIImage(named: value)
            // 设置边界
            imageView.clipsToBounds = true
            // 设置填充模式
            imageView.contentMode = .scaleAspectFill
            // 添加图片视图到scrollView上
            scrollView.addSubview(imageView)
            
            if (index == images.count - 1){
                
                let btn = UIButton(type: .custom)
                btn.frame.size = CGSize(width: 100, height: 30)
                btn.setTitle("开启新页面", for: UIControlState.normal)
                btn.setTitleColor(.white, for: .normal)
                btn.center.x = view.center.x
                btn.center.y = view.frame.size.height - 50
                // 裁剪圆角
                btn.layer.cornerRadius = 5
                btn.layer.masksToBounds = true
                // 添加到图片上
                imageView.addSubview(btn)
                // 开启交互模式(否则按钮无法点击)
                imageView.isUserInteractionEnabled = true
                
                btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
            }
        }
        // 遵守代理
        scrollView.delegate = self
        // 开启分页
        scrollView.isPagingEnabled = true
        // 设置scrollView大小
        scrollView.contentSize = CGSize(width: SCREEN_WIDTH * CGFloat(images.count), height: SCREEN_HEIGHT)
        // 关闭横向滚动线条
        scrollView.showsHorizontalScrollIndicator = false
        
        // 设置当前页面显示图片
        pageControl.currentPage = currentPage
        pageControl.numberOfPages = images.count
        pageControl.isEnabled = false
        pageControl.pageIndicatorTintColor = .white
        pageControl.currentPageIndicatorTintColor = .red
        
        view.addSubview(scrollView)
        view.addSubview(pageControl)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x / SCREEN_WIDTH)
        if (index >= 0 && index <= 2 && index != currentPage) {
            
            currentPage = index
            pageControl.currentPage = currentPage
        }
    }
    
    func btnClick() {
    
        // 弹框信息
        let alterController = UIAlertController(title: "提示", message: "欢迎进入首页", preferredStyle: .alert)
        // 取消按钮
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        // 确定按钮
        let okAction = UIAlertAction(title: "确定", style: .default, handler:{
            (UIAlertAction) -> Void in
            print("点击了确定按钮")
            // 点击开始，设置登录页为新的根控制器
            UIApplication.shared.keyWindow?.rootViewController = LoginViewController()
        })
        
        alterController.addAction(cancelAction)
        alterController.addAction(okAction)
        // 跳转页面
        self.present(alterController, animated: true, completion: {
            print("进入了该方法中")
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

