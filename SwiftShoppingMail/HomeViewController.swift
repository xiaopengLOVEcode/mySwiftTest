//
//  HomeViewController.swift
//  SwiftShoppingMail
//
//  Created by 夏立鹏 on 2022/4/9.
//

import UIKit
import Kingfisher

class HomeViewController: BaseViewController, BannerViewDataSource {
    func numberOfBanners(_ bannerView: BannnerView) -> Int {
        return FakeData.createBanners().count
    }
    
    func viewForBanner(_ bannerView: BannnerView, index: Int, convertView: UIView?) -> UIView {
        if let view =  convertView as? UIImageView {
            view.kf.setImage(with: URL(string: FakeData.createBanners()[index]))
            return view
        } else {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.kf.setImage(with: URL(string: FakeData.createBanners()[index]))
            return imageView
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hidesBottomBarWhenPushed = false
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bannerView = BannnerView(frame: CGRect(x: 0, y: 0, width:UIScreen.main.bounds.width, height: 176))
        bannerView.autoScrollInterval = 2
        bannerView.backgroundColor = .blue
        bannerView.isInfinite = true
        bannerView.dataSource = self
        view.addSubview(bannerView)
        
    }
    


}
