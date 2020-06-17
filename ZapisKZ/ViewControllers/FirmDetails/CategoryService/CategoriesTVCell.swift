//
//  ServicesTVCell.swift
//  ZapisKZ
//
//  Created by Rauan on 5/14/20.
//  Copyright © 2020 Rauan. All rights reserved.
//

import UIKit

class CategoriesTVCell: UITableViewCell {
    
    var categories: [Category] = [] {
        didSet {
            categoriesCollectionView.reloadData()
        }
    }
    
    var selectedCategoryId: Int? = nil {
        didSet {
            categoriesCollectionView.reloadData()
        }
    }
    
    var categorySelectedAction: ((Int) -> Void)?
    
    let categoryCellId = "serviceCellId"
    
    lazy var categoriesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .clear
        view.register(CategoryCVCell.self, forCellWithReuseIdentifier: categoryCellId)
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
        
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        
        addSubview(categoriesCollectionView)
        
        categoriesCollectionView.snp.makeConstraints { (make) in
            make.left.top.right.bottom.equalToSuperview()
            make.height.equalTo(100)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension CategoriesTVCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.height, height: collectionView.frame.size.height)
    }
  
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryCellId, for: indexPath) as? CategoryCVCell
        var category: Category?
        if indexPath.item != 0 {
            category = categories[indexPath.item - 1]
            category?.isSelected = category?.id == selectedCategoryId
        }
        if indexPath.item == 0 {
            cell?.button.backgroundColor = selectedCategoryId == nil ? .appPurple : .white
            cell?.button.setIconColor(color: selectedCategoryId == nil ? .white : .black)
        }
        cell?.category = category
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        categorySelectedAction!(indexPath.item - 1)
    }
}
