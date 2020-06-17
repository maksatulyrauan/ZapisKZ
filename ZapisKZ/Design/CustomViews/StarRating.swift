//
//  StarRating.swift
//  ZapisKZ
//
//  Created by Rauan on 5/15/20.
//  Copyright © 2020 Rauan. All rights reserved.
//

import UIKit

class StarRating: UIView {
    
    var rating: Float = 5.0 {
        didSet {
            ratingLabel.text = "\(rating)"
        }
    }
    
    func starView() -> UIImageView {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "star")
        view.contentMode = .scaleAspectFit
        return view
    }
    
    lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.setParams(font: .BOLD, size: 16, textColor: .appYellow)
        return label
    }()
    
    lazy var star1 = starView()
    lazy var star2 = starView()
    lazy var star3 = starView()
    lazy var star4 = starView()
    lazy var star5 = starView()
    
    init() {
        super.init(frame: .zero)
        
        addSubview(ratingLabel)
        addSubview(star1)
        addSubview(star2)
        addSubview(star3)
        addSubview(star4)
        addSubview(star5)
        
        ratingLabel.snp.makeConstraints { (make) in
            make.left.centerY.equalToSuperview()
        }
        star1.snp.makeConstraints { (make) in
            make.height.width.equalTo(15)
            make.top.bottom.equalToSuperview()
            make.left.equalTo(ratingLabel.snp.right).offset(5)
        }
        star2.snp.makeConstraints { (make) in
            make.left.equalTo(star1.snp.right).offset(5)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(star1.snp.height)
        }
        star3.snp.makeConstraints { (make) in
            make.left.equalTo(star2.snp.right).offset(5)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(star1.snp.height)
        }
        star4.snp.makeConstraints { (make) in
            make.left.equalTo(star3.snp.right).offset(5)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(star1.snp.height)
        }
        star5.snp.makeConstraints { (make) in
            make.left.equalTo(star4.snp.right)
            make.centerY.right.equalToSuperview()
            make.width.height.equalTo(star1.snp.height)
        }
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
