//
//  PruductList.swift
//  SwiftShoppingMail
//
//  Created by 夏立鹏 on 2022/4/10.
//

import Foundation
import UIKit
import SnapKit

class ProductCell: UITableViewCell {
    
    let priceLable: UILabel
    let productImageView: UIImageView
    
    override var item: Product? {
        didSet {
            if let p = self.item {
                self.productImageView.kf.setImage(with: URL(string: p.imageUrl))
                self.textLabel?.text = p.name
                self.priceLable.text = "$\(p.price)"
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        priceLable = UILabel(frame: .zero)
        productImageView = UIImageView()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViews()
    }
}


class ProductList:UIView,UITableViewDataSource,UITableViewDelegate {
    
    let tableView: UITableView
    var items: [Product]! {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    
    override init(frame: CGRect) {
        tableView = UITableView(frame: .zero,style: .plain)
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellId") as? ProductCell
        if cell == nil {
            cell = ProductCell()
        }
        cell?.item = items[indexPath.row]
        return cell
    }
    
    var tableView: UITableView
    
    
    
    
}
