//
//  DetailsTVManager.swift
//  ZapisKZ
//
//  Created by Rauan on 5/15/20.
//  Copyright © 2020 Rauan. All rights reserved.
//

import UIKit

class DetailsTVManager: NSObject {
    
    var firmDetails: FirmDetails?
    
    let imagesCellId = "imagesCellId"
    let infoCellId = "infoCellId"
    let headerCellId = "headerCellId"
    let scheduleCellId = "scheduleCellId"
    let serviceCellId = "serviceCellId"
    let categoriesCellId = "categoriesCellId"
    let masterCellId = "masterCellId"
    let cellId = "cellId"
    
    var scheduleExpanded = false
    var servicesExpanded = false
    var selectedCategory: Category?
    
    var services = [Service]()
    var masters = [Master]()
    
    init(firmDetails: FirmDetails) {
        self.firmDetails = firmDetails
        
        services = firmDetails.services
        masters = firmDetails.masters
        
        servicesExpanded = services.count <= 4
    }
    
    func categorySelected(tableView: UITableView, index: Int) {
        if index < 0 {
            selectedCategory = nil
        }
        else {
            selectedCategory = firmDetails?.categories[index]
        }
        
        if selectedCategory == nil {
            services = firmDetails?.services ?? []
            masters = firmDetails?.masters ?? []
        }
        else {
            services = firmDetails?.services.filter({$0.categoryId == selectedCategory?.id}) ?? []
            masters = firmDetails?.masters.filter({$0.serviceIds.contains(selectedCategory?.id ?? 0)}) ?? []
        }
        servicesExpanded = services.count <= 4
        tableView.reloadData()
    }
    
    func expandServices(tableView: UITableView) {
        servicesExpanded.toggle()
        tableView.reloadData()
    }
}
extension DetailsTVManager: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        }
        else if section == 1 {
            return scheduleExpanded ? 7 : 1
        }
        else if section == 2 {
            if servicesExpanded {
                return 2 + services.count
            }
            else {
                return 2 + 5
            }
        }
        else if section == 3 {
            return 1 + masters.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                return setupImagesCell(tableView: tableView, indexPath: indexPath)
            }
            return setupInfoCell(tableView: tableView, indexPath: indexPath)
        }
        else if indexPath.section == 1 {
            return setupScheduleCell(tableView: tableView, indexPath: indexPath)
        }
        else if indexPath.section == 2 {
            if indexPath.row == 0 {
                return setupHeaderCell(tableView: tableView, indexPath: indexPath)
            }
            else if indexPath.row == 1 {
                return setupCategoriesCell(tableView: tableView, indexPath: indexPath)
            }
            return setupServiceCell(tableView: tableView, indexPath: indexPath)
        }
        else if indexPath.section == 3 {
            if indexPath.row == 0 {
                return setupHeaderCell(tableView: tableView, indexPath: indexPath)
            }
            return setupMasterCell(tableView: tableView, indexPath: indexPath)
        }
        return cell
    }
    
    func setupImagesCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: imagesCellId, for: indexPath) as! ImagesTVCell
        cell.imageUrls = firmDetails?.firm?.pictures ?? []
        return cell
    }
    
    func setupInfoCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: infoCellId, for: indexPath) as! FirmInfoTVCell
        guard let firm = firmDetails?.firm else { return cell }
        cell.firmViewModel = FirmViewModel(firm, firmDetails?.location)
        return cell
    }
    
    func setupScheduleCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: scheduleCellId, for: indexPath) as! ScheduleTVCell
        cell.scheduleViewModel = ScheduleViewModel(indexPath.row, firmDetails?.firm?.workStartTime ?? "", firmDetails?.firm?.workEndTime ?? "", scheduleExpanded)
        return cell
    }
    
    func setupHeaderCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: headerCellId, for: indexPath) as! DetailHeaderTVCell
        cell.section = indexPath.section
        return cell
    }
    
    func setupCategoriesCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: categoriesCellId, for: indexPath) as! CategoriesTVCell
        cell.categories = firmDetails?.categories ?? []
        cell.selectedCategoryId = selectedCategory?.id
        cell.categorySelectedAction = { _index in self.categorySelected(tableView: tableView, index: _index) }
        return cell
    }
    
    func setupServiceCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: serviceCellId, for: indexPath) as! ServiceTVCell
        let service = services[indexPath.row - 2]
        cell.serviceViewModel = ServiceViewModel(service)
        if !servicesExpanded, indexPath.row == 6 {
            cell.expandLabel.isHidden = false
        }
        else {
            cell.expandLabel.isHidden = true
        }
        cell.expandAction = { [weak self] in self?.expandServices(tableView: tableView) }
        return cell
    }
    
    func setupMasterCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: masterCellId, for: indexPath) as! MasterTVCell
        let master = masters[indexPath.row - 1]
        cell.masterViewModel = MasterViewModel(master)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let shadowView = UIView()
        let gradient = CAGradientLayer()
        gradient.frame.size = CGSize(width: tableView.bounds.width, height: 2)

        let stopColor = UIColor.appGray.cgColor
        let startColor = UIColor.appLightGray.cgColor

        gradient.colors = [stopColor, startColor]
        gradient.locations = [0.0,0.8]

        shadowView.layer.addSublayer(gradient)

        return shadowView
    }
}
extension DetailsTVManager: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1, indexPath.row == 0 {
            scheduleExpanded.toggle()
            tableView.reloadSections([indexPath.section], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        var alpha: CGFloat = 0
        if y < 0 {
            alpha = 0
        }
        else if y > 145 {
            alpha = 1
        }
        else {
            alpha = CGFloat(Double(y) / Double(145))
        }
        if let rootVC = (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController as? UINavigationController {
            rootVC.setNavigationBarHidden(false, animated: false)
            rootVC.navigationBar.setBackgroundImage(UIImage(), for: .default)
            rootVC.navigationBar.shadowImage = UIImage()
            rootVC.navigationBar.isTranslucent = true
            rootVC.navigationBar.backgroundColor = UIColor.white.withAlphaComponent(alpha)
            let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(alpha)]
            rootVC.navigationBar.titleTextAttributes = textAttributes
            UIApplication.shared.statusBarView?.backgroundColor = UIColor.white.withAlphaComponent(alpha)
            
        }
    }
}
