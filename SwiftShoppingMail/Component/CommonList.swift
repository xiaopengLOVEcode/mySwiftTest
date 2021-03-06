//
//  CommonList.swift
//  SwiftShoppingMail
//
//  Created by 夏立鹏 on 2022/4/18.
//

import Foundation
import UIKit
import SnapKit

class CommonListCell<ItemType>: UITableViewCell {
    var item: ItemType?
    required override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


protocol CommonListDelegate: AnyObject {
    func didSelectItem<Item>(_ item: Item)
}

class CommonList<ItemType, CellType: CommonListCell<ItemType>>: UIView,UITableViewDataSource,UITableViewDelegate {
    
    let tableView: UITableView
    weak var delegate: CommonListDelegate?
    
    
    var items: [ItemType]! = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        tableView = UITableView(frame: .zero,style: .plain)
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: CellType? = tableView.dequeueReusableCell(withIdentifier: "cellId") as? CellType
        if cell == nil {
            cell = CellType(style: .subtitle, reuseIdentifier: "cellId")
        }
        cell?.item = items[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectItem(items[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func setupViews() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        self.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
