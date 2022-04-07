//
//  ViewController.swift
//  SwiftShoppingMail
//
//  Created by 夏立鹏 on 2022/4/7.
//

import UIKit
import SnapKit

class ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(type: .custom)
        button.setTitle("click", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didClickButton), for: .touchUpInside)
        
        
        button.snp.makeConstraints { make in
            make.left.top.equalTo(100)
            make.height.equalTo(100)
            make.width.equalTo(50)
        }

        view.addSubview(button)
    }
    
    @objc func didClickButton() {
        let loginVc = LoginViewController()
        navigationController?.pushViewController(loginVc, animated: true)
    }


}

