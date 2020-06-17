//
//  MasterTVCell.swift
//  ZapisKZ
//
//  Created by Rauan on 5/14/20.
//  Copyright © 2020 Rauan. All rights reserved.
//

import UIKit

class MasterTVCell: UITableViewCell {
    
    var masterViewModel: MasterViewModel? = nil {
        didSet {
            masterImageView.kf.setImage(with: URL(string: masterViewModel?.avatarUrl ?? ""))
            masterNameLabel.text = masterViewModel?.name
            professionLabel.text = masterViewModel?.profession
            ratingLabel.text = masterViewModel?.rating
            ratingView.isHidden = masterViewModel?.rating == nil
        }
    }
    
    lazy var masterImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var masterNameLabel: UILabel = {
        let label = UILabel()
        label.setParams(font: .BOLD, size: 12, textColor: .black)
        return label
    }()
    
    lazy var professionLabel: UILabel = {
        let label = UILabel()
        label.setParams(font: .REGULAR, size: 10, textColor: .appGray)
        return label
    }()
    
    lazy var nextLabel: UILabel = {
        let label = UILabel()
        label.text = ">"
        label.setParams(font: .SEMIBOLD, size: 16, textColor: .appGray)
        return label
    }()
    
    lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.setParams(font: .BOLD, size: 12, textColor: .appYellow)
        return label
    }()
    
    lazy var ratingView: UIView = {
        let view = UIView()
        
        let dot = UILabel()
        dot.text = "・"
        dot.setParams(font: .SEMIBOLD, size: 16, textColor: .appGray)
        
        let star = UIImageView()
        star.image = #imageLiteral(resourceName: "star")
        star.contentMode = .scaleAspectFit
        
        view.addSubview(dot)
        view.addSubview(ratingLabel)
        view.addSubview(star)
        
        dot.snp.makeConstraints { (make) in
            make.left.centerY.equalToSuperview()
        }
        ratingLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(dot.snp.right)
            make.right.equalTo(star.snp.left)
        }
        star.snp.makeConstraints { (make) in
            make.height.width.equalTo(10)
            make.right.top.bottom.equalToSuperview()
        }
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupBackground()
        setupViews()
    }
    
    
    
    func setupBackground() {
        selectionStyle = .none
    }
    
    func setupViews() {
        addSubview(masterImageView)
        addSubview(masterNameLabel)
        addSubview(professionLabel)
        addSubview(ratingView)
        addSubview(nextLabel)
        
        masterImageView.snp.makeConstraints { (make) in
            make.height.width.equalTo(30)
            make.left.top.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset(-15)
        }
        masterNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(masterImageView.snp.top)
            make.left.equalTo(masterImageView.snp.right).offset(10)
        }
        professionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(masterNameLabel.snp.bottom).offset(5)
            make.left.equalTo(masterNameLabel.snp.left)
        }
        ratingView.snp.makeConstraints { (make) in
            make.centerY.equalTo(professionLabel.snp.centerY)
            make.left.equalTo(professionLabel.snp.right)
        }
        nextLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-10)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        masterImageView.layer.cornerRadius = masterImageView.frame.size.height / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
