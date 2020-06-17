//
//  ImagesTVCell.swift
//  ZapisKZ
//
//  Created by Rauan on 5/14/20.
//  Copyright © 2020 Rauan. All rights reserved.
//

import UIKit

class ImagesTVCell: UITableViewCell {
    
    var imageUrls: [String] = [] {
        didSet {
            imagesCollectionView.reloadData()
        }
    }
    
    let imageCellId = "imageCellId"
    
    lazy var imagesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
        view.isPagingEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .clear
        view.register(ImageCVCell.self, forCellWithReuseIdentifier: imageCellId)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupBackground()
        setupViews()
    }
    
    private func setupBackground() {
        
    }
    
    private func setupViews() {
        
        imagesCollectionView.delegate = self
        imagesCollectionView.dataSource = self
        
        addSubview(imagesCollectionView)
        
        imagesCollectionView.snp.makeConstraints { (make) in
            make.left.top.right.bottom.equalToSuperview()
            make.height.equalTo(240)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension ImagesTVCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
  
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: imageCellId, for: indexPath) as? ImageCVCell
        let imageUrl = Constants.sharedInstance.apiEndpoint + imageUrls[indexPath.item]
        cell?.imageView.kf.setImage(with: URL(string: imageUrl))
        return cell!
    }
    

}
