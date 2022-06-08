//
//  DealViewController.swift
//  SwiftShoppingMail
//
//  Created by 夏立鹏 on 2022/4/18.
//

import UIKit

class DealViewController: BaseViewController, CommonListDelegate {
    func didSelectItem<Item>(_ item: Item) {
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let productList = CommonList<Deal, DealListCell>(frame: .zero)
        productList.items = FakeData.createDeals()
        productList.backgroundColor = .blue
        productList.delegate = self
        view.addSubview(productList)
        productList.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
        }
        
    }
    


}
