//
//  ScheduleTVCell.swift
//  ZapisKZ
//
//  Created by Rauan on 5/15/20.
//  Copyright © 2020 Rauan. All rights reserved.
//

import UIKit

class ScheduleTVCell: UITableViewCell {
    
    var scheduleViewModel: ScheduleViewModel? = nil {
        didSet {
            dayOfWeekLabel.text = scheduleViewModel?.day_str
            timeLabel.text = scheduleViewModel?.schedule
            if scheduleViewModel?.today ?? false {
                dayOfWeekLabel.backgroundColor = .appPurple
                dayOfWeekLabel.textColor = .white
            }
            else {
                dayOfWeekLabel.backgroundColor = .appLightGray
                dayOfWeekLabel.textColor = .appGray
            }
            expandLabel.isHidden = scheduleViewModel?.index != 0
            
            expandLabel.text = scheduleViewModel?.expand_str
        }
    }
    
    lazy var dayOfWeekLabel: PaddingLabel = {
        let label = PaddingLabel(withInsets: 5, 5, 5, 5)
        label.backgroundColor = .appLightGray
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.setParams(font: .REGULAR, size: 14, textColor: .appGray)
        return label
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.setParams(font: .REGULAR, size: 12, textColor: .appGray)
        return label
    }()
    
    lazy var expandLabel: UILabel = {
        let label = UILabel()
        label.setParams(font: .REGULAR, size: 14, textColor: .appPurple)
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
        addSubview(dayOfWeekLabel)
        addSubview(timeLabel)
        addSubview(expandLabel)
        
        dayOfWeekLabel.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
        timeLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(dayOfWeekLabel.snp.centerY)
            make.left.equalTo(dayOfWeekLabel.snp.right).offset(10)
        }
        expandLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
