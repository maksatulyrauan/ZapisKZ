//
//  FirmInfoTVCell.swift
//  ZapisKZ
//
//  Created by Rauan on 5/14/20.
//  Copyright © 2020 Rauan. All rights reserved.
//

import UIKit

class FirmInfoTVCell: UITableViewCell {
    
    var firmViewModel: FirmViewModel? = nil {
        didSet {
            ratingView.rating = firmViewModel?.rating_fl ?? 5.0
            firmNameLabel.text = firmViewModel?.name
            firmTypeLabel.text = firmViewModel?.category
            addressLabel.text = firmViewModel?.address
            reviewsLabel.text = firmViewModel?.reviewCount
        }
    }
    
    lazy var firmNameLabel: UILabel = {
        let label = UILabel()
        label.setParams(font: .BOLD, size: 16, textColor: .black)
        return label
    }()
    
    lazy var firmTypeLabel: UILabel = {
        let label = UILabel()
        label.setParams(font: .BOLD, size: 14, textColor: .appGray)
        return label
    }()
    
    lazy var locationButton = Button(icon: #imageLiteral(resourceName: "location"))
    
    lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openMap)))
        label.setParams(font: .REGULAR, size: 12, textColor: .appGray)
        return label
    }()
    
    lazy var instagramButton = Button(icon: #imageLiteral(resourceName: "instagram"))
    
    lazy var callButton = Button(icon: #imageLiteral(resourceName: "call"))
    
    lazy var divider: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    lazy var peopleAmountLabel: UILabel = {
        let label = UILabel()
        label.text = "11"
        label.setParams(font: .REGULAR, size: 14, textColor: .appPurple)
        return label
    }()
    
    lazy var reviewsLabel: UILabel = {
        let label = UILabel()
        label.setParams(font: .REGULAR, size: 12, textColor: .appGray)
        return label
    }()
    
    lazy var peopleImageVIew: UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "people").withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        view.tintColor = .appPurple
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var ratingView = StarRating()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        locationButton.addTarget(self, action: #selector(openMap), for: .touchUpInside)
        
        setupBackground()
        setupViews()
    }
    
    @objc func openMap() {
        let mapVC = MapVC()
        if let rootVC = (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController as? UINavigationController {
            mapVC.location = firmViewModel?.location
            rootVC.pushViewController(mapVC, animated: true)
        }
    }
    
    private func setupBackground() {
        selectionStyle = .none
    }
    
    private func setupViews() {
        addSubview(firmNameLabel)
        addSubview(firmTypeLabel)
        addSubview(locationButton)
        addSubview(addressLabel)
        addSubview(instagramButton)
        addSubview(callButton)
        addSubview(divider)
        addSubview(peopleAmountLabel)
        addSubview(peopleImageVIew)
        addSubview(ratingView)
        addSubview(reviewsLabel)
        
        firmNameLabel.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        firmTypeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(firmNameLabel.snp.left)
            make.right.equalTo(firmNameLabel.snp.right)
            make.top.equalTo(firmNameLabel.snp.bottom).offset(10)
        }
        locationButton.snp.makeConstraints { (make) in
            make.height.width.equalTo(30)
            make.left.equalTo(firmNameLabel.snp.left)
            make.top.equalTo(firmTypeLabel.snp.bottom).offset(10)
        }
        addressLabel.snp.makeConstraints { (make) in
            make.left.equalTo(locationButton.snp.right).offset(10)
            make.right.equalTo(instagramButton.snp.left).offset(-10)
            make.centerY.equalTo(locationButton.snp.centerY)
        }
        instagramButton.snp.makeConstraints { (make) in
            make.height.width.equalTo(locationButton.snp.width)
            make.centerY.equalTo(locationButton.snp.centerY)
            make.right.equalTo(callButton.snp.left).offset(-10)
        }
        callButton.snp.makeConstraints { (make) in
            make.height.width.equalTo(locationButton.snp.width)
            make.centerY.equalTo(locationButton.snp.centerY)
            make.right.equalTo(firmNameLabel.snp.right)
        }
        divider.snp.makeConstraints { (make) in
            make.left.equalTo(firmNameLabel.snp.left)
            make.right.equalTo(firmNameLabel.snp.right)
            make.height.equalTo(0.5)
            make.top.equalTo(locationButton.snp.bottom).offset(20)
        }
        peopleImageVIew.snp.makeConstraints { (make) in
            make.left.equalTo(firmNameLabel.snp.left)
            make.top.equalTo(divider.snp.bottom).offset(20)
            make.width.height.equalTo(ratingView.snp.height)
        }
        peopleAmountLabel.snp.makeConstraints { (make) in
            make.left.equalTo(peopleImageVIew.snp.right).offset(10)
            make.centerY.equalTo(peopleImageVIew.snp.centerY)
        }
        
        ratingView.snp.makeConstraints { (make) in
            make.right.equalTo(firmNameLabel.snp.right)
            make.centerY.equalTo(peopleImageVIew.snp.centerY)
        }
        reviewsLabel.snp.makeConstraints { (make) in
            make.left.equalTo(ratingView.snp.left)
            make.top.equalTo(ratingView.snp.bottom).offset(5)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


