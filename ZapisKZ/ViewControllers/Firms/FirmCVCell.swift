//
//  BeautyShopCollectionViewCell.swift
//  ZapisKZ
//
//  Created by Rauan on 5/12/20.
//  Copyright © 2020 Rauan. All rights reserved.
//

import UIKit
import Kingfisher

class FirmCVCell: UICollectionViewCell {
    
    var firmViewModel: FirmViewModel? = nil {
        didSet {
            firmImageView.kf.setImage(with: URL(string: firmViewModel?.imageUrl ?? ""))
            firmNameLabel.text = firmViewModel?.name
            firmAddressLabel.text = firmViewModel?.address
            firmTypeLabel.text = firmViewModel?.type
            ratingLabel.text = firmViewModel?.rating_str
        }
    }
    
    lazy var view: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.58
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
        view.layer.shadowRadius = 3
        view.layer.masksToBounds = false
        
        view.backgroundColor = .white
        return view
    }()
    
    lazy var firmImageView: UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "barbershop")
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        if #available(iOS 11.0, *) {
            view.layer.maskedCorners = [CACornerMask.layerMinXMinYCorner, CACornerMask.layerMaxXMinYCorner]
            
        } else {}
        
        view.contentMode = .scaleToFill
        return view
    }()
    
    lazy var firmTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "Салон красоты"
        label.setParams(font: .REGULAR, size: 10, textColor: .black)
        return label
    }()
    
    lazy var firmNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Avessa во 2 мкр"
        label.setParams(font: .BOLD, size: 12, textColor: .black)
        return label
    }()
    
    lazy var firmAddressLabel: UILabel = {
        let label = UILabel()
        label.text = "мкр. 2, дом 55"
        label.setParams(font: .REGULAR, size: 10, textColor: .black)
        return label
    }()
    
    lazy var divider: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    lazy var peopleAmountLabel: UILabel = {
        let label = UILabel()
        label.text = "11"
        label.setParams(font: .REGULAR, size: 10, textColor: .black)
        return label
    }()
    
    lazy var peopleImageVIew: UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "people")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var tgLabel: UILabel = {
        let label = UILabel()
        label.text = "・ ₸ ₸ ₸"
        label.setParams(font: .REGULAR, size: 10, textColor: .gray)
        return label
    }()
    
    lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "4.5"
        label.setParams(font: .REGULAR, size: 10, textColor: .appYellow)
        return label
    }()
    
    lazy var ratingImageView: UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "star")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupBackground()
        setupViews()
    }
    
    private func setupBackground() {
        
    }
    
    private func setupViews() {
        addSubview(view)
        
        view.addSubview(firmImageView)
        view.addSubview(firmTypeLabel)
        view.addSubview(firmNameLabel)
        view.addSubview(firmAddressLabel)
        view.addSubview(divider)
        view.addSubview(peopleAmountLabel)
        view.addSubview(peopleImageVIew)
        view.addSubview(tgLabel)
        view.addSubview(ratingLabel)
        view.addSubview(ratingImageView)
        
        view.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(10)
            make.right.bottom.equalToSuperview().offset(-10)
        }
        
        firmImageView.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(view.snp.height).dividedBy(2)
        }
        firmTypeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left).offset(10)
            make.right.equalTo(view.snp.right).offset(-10)
            make.top.equalTo(firmImageView.snp.bottom).offset(10)
        }
        firmNameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(firmTypeLabel.snp.left)
            make.right.equalTo(firmTypeLabel.snp.right)
            make.top.equalTo(firmTypeLabel.snp.bottom)
        }
        firmAddressLabel.snp.makeConstraints { (make) in
            make.left.equalTo(firmTypeLabel.snp.left)
            make.right.equalTo(firmTypeLabel.snp.right)
            make.top.equalTo(firmNameLabel.snp.bottom)
        }
        divider.snp.makeConstraints { (make) in
            make.left.equalTo(firmTypeLabel.snp.left)
            make.right.equalTo(firmTypeLabel.snp.right)
            make.height.equalTo(0.5)
            make.bottom.equalTo(peopleAmountLabel.snp.top).offset(-10)
        }
        peopleAmountLabel.snp.makeConstraints { (make) in
            make.left.equalTo(firmTypeLabel.snp.left)
            make.bottom.equalTo(view.snp.bottom).offset(-10)
        }
        peopleImageVIew.snp.makeConstraints { (make) in
            make.width.height.equalTo(10)
            make.left.equalTo(peopleAmountLabel.snp.right).offset(5)
            make.centerY.equalTo(peopleAmountLabel.snp.centerY)
        }
        tgLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(peopleAmountLabel.snp.centerY)
            make.left.equalTo(peopleImageVIew.snp.right).offset(10)
        }
        ratingLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(ratingImageView.snp.centerY)
        }
        ratingImageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(peopleImageVIew.snp.width)
            make.left.equalTo(ratingLabel.snp.right).offset(5)
            make.right.equalTo(firmTypeLabel.snp.right)
            make.centerY.equalTo(peopleAmountLabel.snp.centerY)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
