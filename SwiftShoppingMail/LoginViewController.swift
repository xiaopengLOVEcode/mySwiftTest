//
//  LoginViewController.swift
//  SwiftShoppingMail
//
//  Created by 夏立鹏 on 2022/4/7.
//

import UIKit
import SnapKit

protocol ValiddatesPhoneNumber {
    func validdatesPhoneNumber (_ phoneNumber: String) ->Bool;
    
}

protocol ValiddatesPassWord {
    func validdatePassWord (_ password: String) ->Bool;
}

extension ValiddatesPhoneNumber {
    func validdatesPhoneNumber (_ phoneNumber: String) ->Bool {
        if phoneNumber.count != 11 {
            return false
        }
        return true
    }
}

extension ValiddatesPassWord {
    func validdatePassWord (_ password: String) ->Bool {
        if password.count < 6 || password.count > 12 {
            return false
        }
        return true
    }
}

class LoginViewController: BaseViewController, ValiddatesPassWord,ValiddatesPhoneNumber {
    
    var phoneTextFiled: UITextField!
    var passwordTextFiled: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        let logoView = UIImageView(image: R.image.logo())
        logoView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
        }
        view.addSubview(logoView)
        
        let phoneIconView = UIImageView(image: R.image.icon_phone())
        phoneTextFiled = UITextField()
        phoneTextFiled.leftView = phoneIconView
        phoneTextFiled.leftViewMode = .always
        phoneTextFiled.layer.borderColor = UIColor.hexColor(0x333333).cgColor
        phoneTextFiled.layer.borderWidth = 1
        phoneTextFiled.textColor = UIColor.hexColor(0x333333)
        phoneTextFiled.layer.cornerRadius = 5
        phoneTextFiled.placeholder = "请输入手机号"
        phoneTextFiled.isSecureTextEntry = true
        phoneTextFiled.layer.masksToBounds = true
        phoneTextFiled.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalTo(logoView.snp_bottom).offset(-20)
            make.top.equalTo(logoView.snp_bottom).offset(15)
            make.height.equalTo(50)
        }
        
        
        let loginBtn = UIButton(type: .custom)
        loginBtn.setTitle("登录", for: .normal)
        loginBtn.setTitleColor(.white, for: .normal)
        loginBtn.layer.cornerRadius = 5
        loginBtn.layer.masksToBounds = true
        loginBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        loginBtn.backgroundColor = UIColor.hexColor(0xf8892e)
        
        loginBtn .setBackgroundImage(UIColor.hexColor(0xf8892e).toImage(), for: .normal)
        view.addSubview(loginBtn)
        loginBtn.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(passwordTextFiled.snp_bottom).offset(20)
            make.height.equalTo(50)
        }
        
        loginBtn.addTarget(self, action: #selector(didClickLogInBtn), for: .touchUpInside)
    }
    
    
    @objc func didClickLogInBtn() {
        if validdatesPhoneNumber(phoneTextFiled.text ?? "")  &&
            validdatePassWord(passwordTextFiled.text ?? "") {
            
        } else {
            self.showToast()
        }
        
    }
    func showToast() {
        let alertVC = UIAlertController(title: "warning!", message: "account input occur error", preferredStyle: .alert)
        present(alertVC, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            alertVC.dismiss(animated: true, completion: nil)
        }
    }


}
