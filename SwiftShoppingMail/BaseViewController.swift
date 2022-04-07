//
//  BaseViewController.swift
//  SwiftShoppingMail
//
//  Created by 夏立鹏 on 2022/4/7.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.hexColor(0xf2f4f7)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.hexColor(0x333333)]
        edgesForExtendedLayout = UIRectEdge(rawValue: 0)
    }


}
