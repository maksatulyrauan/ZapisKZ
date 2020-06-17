//
//  BeautyShopsListView.swift
//  ZapisKZ
//
//  Created by Rauan on 5/12/20.
//  Copyright © 2020 Rauan. All rights reserved.
//

import UIKit

class FirmsListView: UITableViewCell {
    
    let cellId = "cellId"
    
    var category: FirmsCategory? = nil {
        didSet {
            firmsCollectionView.reloadData()
        }
    }
    
    lazy var firmsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .clear
        view.register(FirmCVCell.self, forCellWithReuseIdentifier: cellId)
        return view
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
        addSubview(firmsCollectionView)
        
        firmsCollectionView.delegate = self
        firmsCollectionView.dataSource = self
        
        firmsCollectionView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
            make.height.equalTo(200)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FirmsListView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch category {
        case .RECOMMENDED:
            return DataHolder.sharedInstance.recommendedFirms.count
        case .POPULAR:
            return DataHolder.sharedInstance.popularFirms.count
        case .NEW:
            return DataHolder.sharedInstance.recentlyAddedFirms.count
        default:
            break
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.height * 0.9, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var firm: Firm!
        switch category {
        case .RECOMMENDED:
            firm = DataHolder.sharedInstance.recommendedFirms[indexPath.item]
        case .POPULAR:
            firm = DataHolder.sharedInstance.popularFirms[indexPath.item]
        case .NEW:
            firm = DataHolder.sharedInstance.recentlyAddedFirms[indexPath.item]
        default:
            break
        }
        let vc = FirmDetailsVC()
        ApiManager.sharedInstance.getFirmInfo(firmId: firm.id) { (firmDetails) in
            if let rootVC = (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController as? UINavigationController {
                vc.firmDetails = firmDetails
                rootVC.pushViewController(vc, animated: true)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? FirmCVCell
        var firm: Firm!
        switch category {
        case .RECOMMENDED:
            firm = DataHolder.sharedInstance.recommendedFirms[indexPath.item]
        case .POPULAR:
            firm = DataHolder.sharedInstance.popularFirms[indexPath.item]
        case .NEW:
            firm = DataHolder.sharedInstance.recentlyAddedFirms[indexPath.item]
        default:
            break
        }
        let firmViewModel = FirmViewModel(firm)
        
        cell?.firmViewModel = firmViewModel
        
        return cell!
    }
    

}
