//
//  Tab.swift
//  SwiftShoppingMail
//
//  Created by 夏立鹏 on 2022/4/17.
//

import Foundation
import UIKit
import SnapKit


class Tab: UIView {
    var items: [String]
    var itemButtons: [UIButton]!
    var selectedItemButton: UIButton!
    
    var indicatorView: UIView!
    var selectedColor: UIColor? {
        didSet {
            if let color = self.selectedColor {
                self.indicatorView.backgroundColor = color
                itemButtons.forEach { (button) in
                    button.setTitleColor(color, for: .selected)
                }
            } else {
                self.indicatorView.backgroundColor = UIColor.hexColor(0xf8892e)
                itemButtons.forEach { (button) in
                    button.setTitleColor(UIColor.hexColor(0xf8892e), for: .selected)
                }
            }
        }
    }
    var normalColor: UIColor?
    
    
    init?(items: [String]) {  //可失败的初始化方法
        if items.count == 0 {
            return nil
        }
        self.items = items
        itemButtons = []
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func createViews() {
        var lastView: UIView?
        for index in 0...items.count {
            let button = UIButton(type: .custom)
            button.setTitle(items[index], for: .normal)
            button.setTitleColor(UIColor.hexColor(0x333333), for: .normal)
            button.setTitleColor(UIColor.hexColor(0xf98892e), for: .selected)
            self.addSubview(button)
            if index == 0 {
                selectedItemButton = button
            }
            
            button.snp.makeConstraints { make in
                if index == 0 {
                    make.left.equalToSuperview()
                } else {
                    make.left.equalTo(lastView!.snp_right)
                    make.width.equalTo(lastView!)
                }
                make.top.bottom.equalToSuperview()
                if index == items.count - 1 {
                    make.right.equalToSuperview()
                }
            }
            lastView = button
            button.addTarget(self, action: #selector(didClickButton), for: .touchUpInside)
            itemButtons.append(button)
        }
        self.addSubview(indicatorView)
        indicatorView = UIView()
        indicatorView.backgroundColor = UIColor.hexColor(0xf98892e)
        indicatorView.snp.makeConstraints { make in
            make.centerX.equalTo(self.selectedItemButton)
            make.bottom.equalToSuperview()
            make.width.equalTo(80)
            make.height.equalTo(4)
        }
    }
    
    
    @objc func didClickButton(sender: UIButton) {
        guard sender != selectedItemButton else {
            return
        }
        selectedItemButton.isSelected = false
        sender.isSelected = true
        selectedItemButton = sender
        UIView.animate(withDuration: 3) {
            self.indicatorView.snp.remakeConstraints { make in
                make.centerX.equalTo(self.selectedItemButton)
                make.bottom.equalToSuperview()
                make.width.equalTo(80)
                make.height.equalTo(4)
            }
        }
    }
    
}
