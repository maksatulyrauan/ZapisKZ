//
//  DetailHeaderTVCell.swift
//  ZapisKZ
//
//  Created by Rauan on 5/14/20.
//  Copyright © 2020 Rauan. All rights reserved.
//

import UIKit

class DetailHeaderTVCell: UITableViewCell {
    
    var section: Int? = nil {
        didSet {
            if section == 2 {
                titleLabel.text = "Список услуг"
            }
            else if section == 3 {
                titleLabel.text = "Мастера"
            }
        }
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.setParams(font: .BOLD, size: 14, textColor: .appGray)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupBackground()
        setupViews()
    }
    
    private func setupBackground() {
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    private func setupViews() {
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(10)
            make.bottom.right.equalToSuperview().offset(-10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
