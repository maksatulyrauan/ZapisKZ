//
//  FirmDetailsVC.swift
//  ZapisKZ
//
//  Created by Rauan on 5/14/20.
//  Copyright © 2020 Rauan. All rights reserved.
//

import UIKit

class FirmDetailsVC: UIViewController {
    
    var firmDetails: FirmDetails?
    
    var detailsTVManager: DetailsTVManager?
    
    let imagesCellId = "imagesCellId"
    let infoCellId = "infoCellId"
    let headerCellId = "headerCellId"
    let scheduleCellId = "scheduleCellId"
    let serviceCellId = "serviceCellId"
    let categoriesCellId = "categoriesCellId"
    let masterCellId = "masterCellId"
    let cellId = "cellId"
    
    lazy var firmDetailsTAbleView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .appLightGray
        tv.separatorStyle = .none
        
        tv.showsVerticalScrollIndicator = false
        tv.contentInsetAdjustmentBehavior = .never
        tv.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tv.register(ImagesTVCell.self, forCellReuseIdentifier: imagesCellId)
        tv.register(FirmInfoTVCell.self, forCellReuseIdentifier: infoCellId)
        tv.register(DetailHeaderTVCell.self, forCellReuseIdentifier: headerCellId)
        tv.register(ScheduleTVCell.self, forCellReuseIdentifier: scheduleCellId)
        tv.register(ServiceTVCell.self, forCellReuseIdentifier: serviceCellId)
        tv.register(CategoriesTVCell.self, forCellReuseIdentifier: categoriesCellId)
        tv.register(MasterTVCell.self, forCellReuseIdentifier: masterCellId)
        return tv
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.title = "\(firmDetails?.firm?.name ?? "")"
        
        detailsTVManager = DetailsTVManager(firmDetails: firmDetails ?? FirmDetails())
        
        firmDetailsTAbleView.delegate = detailsTVManager
        firmDetailsTAbleView.dataSource = detailsTVManager
        
        firmDetailsTAbleView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        setupViews()
    }
    
    private func setupBackground() {
        
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0)]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        navigationController?.navigationBar.backgroundColor = UIColor.white.withAlphaComponent(0)
        UIApplication.shared.statusBarView?.backgroundColor = UIColor.white.withAlphaComponent(0)
        
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        
        view.backgroundColor = .white
    }
    
    private func setupViews() {
        view.addSubview(firmDetailsTAbleView)
        
        firmDetailsTAbleView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
    }
}

extension FirmDetailsVC: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
