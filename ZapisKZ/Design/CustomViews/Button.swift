//
//  Button.swift
//  ZapisKZ
//
//  Created by Rauan on 5/14/20.
//  Copyright © 2020 Rauan. All rights reserved.
//

import UIKit

class Button: UIButton {
    
    lazy var iconView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    init(icon: UIImage) {
        super.init(frame: .zero)
        
        iconView.image = icon.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        iconView.tintColor = .black
        setupBackground()
        setupViews()
    }
    
    private func setupBackground() {
        backgroundColor = .appLightGray
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
    
    private func setupViews() {
        addSubview(iconView)
        
        iconView.snp.makeConstraints { (make) in
            make.width.height.equalToSuperview().multipliedBy(0.6)
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    func setIconColor(color: UIColor) {
        iconView.tintColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
