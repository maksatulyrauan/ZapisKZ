//
//  ImageCVCell.swift
//  ZapisKZ
//
//  Created by Rauan on 5/14/20.
//  Copyright © 2020 Rauan. All rights reserved.
//

import UIKit

class ImageCVCell: UICollectionViewCell {
   
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleToFill
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
        addSubview(imageView)
        
        imageView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
