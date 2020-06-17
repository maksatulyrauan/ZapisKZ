//
//  HeaderWIthButtonTableViewCell.swift
//  ZapisKZ
//
//  Created by Rauan on 5/13/20.
//  Copyright © 2020 Rauan. All rights reserved.
//

import UIKit

class FirmHeaderTVCell: UITableViewCell {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.setParams(font: .BOLD, size: 16, textColor: .black)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupBackground()
        setupViews()
    }
    
    private func setupBackground() {
        selectionStyle = .none
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
