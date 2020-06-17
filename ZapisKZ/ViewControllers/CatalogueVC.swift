//
//  CatalogueVC.swift
//  ZapisKZ
//
//  Created by Rauan on 5/12/20.
//  Copyright © 2020 Rauan. All rights reserved.
//

import UIKit
import SnapKit

class CatalogueVC: UIViewController {
    
    let headerCellId = "headerCellId"
    let firmCellId = "firmCellId"
    
    lazy var catalogueTableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .clear
        tv.separatorStyle = .none
        tv.showsVerticalScrollIndicator = false
        tv.register(FirmHeaderTVCell.self, forCellReuseIdentifier: headerCellId)
        tv.register(FirmsListView.self, forCellReuseIdentifier: firmCellId)
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        ApiManager.sharedInstance.getFirms {
            self.catalogueTableView.reloadData()
        }
        setupBackground()
        setupViews()
    }
    
    private func setupBackground() {
        view.backgroundColor = .white
    }

    private func setupViews() {
        catalogueTableView.delegate = self
        catalogueTableView.dataSource = self
        
        view.addSubview(catalogueTableView)
        
        catalogueTableView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
    }
    
}

extension CatalogueVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if indexPath.row == 0 {
            cell = setupHeaderCell(indexPath: indexPath)
        }
        else {
            cell = setupFirmCell(indexPath: indexPath)
        }
        return cell
    }
    
    func setupHeaderCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = catalogueTableView.dequeueReusableCell(withIdentifier: headerCellId, for: indexPath) as! FirmHeaderTVCell
        switch indexPath.section {
        case 0:
            cell.titleLabel.text = "Рекомендуемые"
        case 1:
            cell.titleLabel.text = "Популярные"
        case 2:
            cell.titleLabel.text = "Новые"
        default:
            break
        }
        return cell
    }
    
    func setupFirmCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = catalogueTableView.dequeueReusableCell(withIdentifier: firmCellId, for: indexPath) as! FirmsListView
        switch indexPath.section {
        case 0:
            cell.category = .RECOMMENDED
        case 1:
            cell.category = .POPULAR
        case 2:
            cell.category = .NEW
        default:
            break
        }
        return cell
    }
}

extension CatalogueVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
