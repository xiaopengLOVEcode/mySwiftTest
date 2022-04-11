//
//  ViewController.swift
//  SwiftShoppingMail
//
//  Created by 夏立鹏 on 2022/4/7.
//

import UIKit
import SnapKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let homVc = HomeViewController()
        homVc.tabBarItem.image = R.image.home()
        homVc.tabBarItem.selectedImage = R.image.home_selected()?.withRenderingMode(.alwaysOriginal)
        homVc.tabBarItem.setTitleTextAttributes([.foregroundColor : UIColor.hexColor(0x333333)], for: .selected)
        homVc.tabBarItem.title = "首页"
        
        let navigationHomeVc = UINavigationController(rootViewController: homVc)
        self.addChild(navigationHomeVc)
        
        
        let mainVc = MineViewController()
        mainVc.tabBarItem.image = R.image.mine()
        mainVc.tabBarItem.selectedImage = R.image.mine_selected()?.withRenderingMode(.alwaysOriginal)
        mainVc.tabBarItem.setTitleTextAttributes([.foregroundColor : UIColor.hexColor(0x333333)], for: .selected)
        mainVc.tabBarItem.title = "主页"
       
        let navigationMineVc = UINavigationController(rootViewController: mainVc)
        self.addChild(navigationMineVc)
        
        
//        let button = UIButton(type: .custom)
//        button.setTitle("click", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.addTarget(self, action: #selector(didClickButton), for: .touchUpInside)
//        view.addSubview(button)
//
//        button.snp.makeConstraints { make in
//            make.left.top.equalTo(100)
//            make.height.equalTo(100)
//            make.width.equalTo(50)
//        }
//
//        view.addSubview(button)
    }
    
//    @objc func didClickButton() {
//        let loginVc = LoginViewController()
//        navigationController?.pushViewController(loginVc, animated: true)
//    }


}

