//
//  ServiceTVCell.swift
//  ZapisKZ
//
//  Created by Rauan on 5/15/20.
//  Copyright © 2020 Rauan. All rights reserved.
//

import UIKit

class ServiceTVCell: UITableViewCell {
    
    var serviceViewModel: ServiceViewModel? = nil {
        didSet {
            serviceNameLabel.text = serviceViewModel?.name
            serviceDetailLabel.text = serviceViewModel?.durationAndPrice
        }
    }
    
    var expandAction: (() -> Void)?
    
    lazy var serviceNameLabel: UILabel = {
        let label = UILabel()
        label.setParams(font: .SEMIBOLD, size: 14, textColor: .black)
        return label
    }()
    
    lazy var serviceDetailLabel: UILabel = {
        let label = UILabel()
        label.setParams(font: .REGULAR, size: 12, textColor: .appGray)
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "plus"), for: .normal)
        return button
    }()
    
    lazy var expandLabel: PaddingLabel = {
        let label = PaddingLabel(withInsets: 10, 10, 10, 10)
        label.text = "Еще ⌄"
        label.backgroundColor = .white
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(expand)))
        label.setParams(font: .REGULAR, size: 14, textColor: .appGray)
        return label
    }()
    
    @objc func expand() {
        expandAction!()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupBackground()
        setupViews()
    }
    
    private func setupBackground() {
        selectionStyle = .none
    }
    
    private func setupViews() {
        
        addSubview(serviceNameLabel)
        addSubview(serviceDetailLabel)
        addSubview(button)
        addSubview(expandLabel)
        
        serviceNameLabel.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(10)
        }
        serviceDetailLabel.snp.makeConstraints { (make) in
            make.left.equalTo(serviceNameLabel.snp.left)
            make.top.equalTo(serviceNameLabel.snp.bottom).offset(5)
            make.bottom.equalToSuperview().offset(-10)
        }
        button.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-10)
            make.width.height.equalTo(20)
            make.centerY.equalToSuperview()
        }
        expandLabel.snp.makeConstraints { (make) in
            make.left.equalTo(serviceNameLabel.snp.left)
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
