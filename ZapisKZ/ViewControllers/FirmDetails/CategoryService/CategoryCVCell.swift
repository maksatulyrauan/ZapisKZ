//
//  ServiceCVCell.swift
//  ZapisKZ
//
//  Created by Rauan on 5/14/20.
//  Copyright © 2020 Rauan. All rights reserved.
//

import UIKit

class CategoryCVCell: UICollectionViewCell {
    
    var category: Category? = nil {
        didSet {
            button.iconView.image = #imageLiteral(resourceName: "menu")
            
            if category != nil {
                title.text = category?.name
                button.backgroundColor = category?.isSelected ?? false ? .appPurple : .white
                button.setIconColor(color: category?.isSelected ?? false ? .white : .black)
            }
            else {
                title.text = "Все"
            }
        }
    }
   
    lazy var button = Button(icon: UIImage())
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.setParams(font: .REGULAR, size: 14, textColor: .black)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        button.isUserInteractionEnabled = false
        
        setupBackground()
        setupViews()
    }
    
    private func setupBackground() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.58
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowRadius = 2
        layer.masksToBounds = false
    }
    
    private func setupViews() {
        addSubview(button)
        addSubview(title)
        
        button.snp.makeConstraints { (make) in
            make.height.width.equalToSuperview().multipliedBy(0.6)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(10)
        }
        title.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(button.snp.bottom).offset(5)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
