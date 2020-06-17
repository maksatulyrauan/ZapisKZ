//
//  ApiManager.swift
//  ZapisKZ
//
//  Created by Rauan on 5/12/20.
//  Copyright © 2020 Rauan. All rights reserved.
//

import Alamofire

class ApiManager: NSObject {

    static let sharedInstance = ApiManager()

    private override init(){
        super.init()
    }
    
    func getFirms(successAction: @escaping () -> Void) {
        
        let url = URL(string: Constants.sharedInstance.apiEndpoint + "rest/clients-app/v1/screen/home")!
        
        let headers = [
            "Content-Type": "Application/json"
        ]
        
            
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON { response in

            switch response.result {
            case .success(let response):
                let responseDictionary = response as! [String: Any]

                let data = responseDictionary["data"] as? [String: Any]

                let recommendedFirms = data?["recommendedFirms"] as? [[String: Any]]

                let popularFirms = data?["popularFirms"] as? [[String: Any]]

                let recentlyAddedFirms = data?["recentlyAddedFirms"] as? [[String: Any]]

                for recommendedFirm in recommendedFirms ?? [] {

                    let jsonData = try? JSONSerialization.data(withJSONObject: recommendedFirm)

                    let firm: Firm = try! JSONDecoder().decode(Firm.self, from: jsonData!)
                    
                    DataHolder.sharedInstance.recommendedFirms.append(firm)
                }

                for popularFirm in popularFirms ?? [] {

                    let jsonData = try? JSONSerialization.data(withJSONObject: popularFirm)

                    let firm: Firm = try! JSONDecoder().decode(Firm.self, from: jsonData!)
                    
                    DataHolder.sharedInstance.popularFirms.append(firm)
                }

                for recentlyAddedFirm in recentlyAddedFirms ?? [] {

                    let jsonData = try? JSONSerialization.data(withJSONObject: recentlyAddedFirm)

                    let firm: Firm = try! JSONDecoder().decode(Firm.self, from: jsonData!)

                    DataHolder.sharedInstance.recentlyAddedFirms.append(firm)
                }
                

                successAction()
            case .failure(let error):
                print("error from server: ", error)
            }
        }
    }
    
    func getFirmInfo(firmId: Int, successAction: @escaping (FirmDetails) -> Void) {
            
        let url = URL(string: Constants.sharedInstance.apiEndpoint + "rest/clients-app/v1/firms/\(firmId)")!
            
        let headers = [
            "Content-Type": "Application/json"
        ]
            
            
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON { response in

            print("Response: \(response)")
            switch response.result {
            case .success(let response):
                
                let firmDetails = FirmDetails()
                
                let responseDictionary = response as! [String: Any]

                let data = responseDictionary["data"] as? [String: Any]

                let masters = data?["masters"] as? [[String: Any]]
                
                let services = data?["services"] as? [[String: Any]]
                
                let categories = data?["categories"] as? [[String: Any]]
                
                for service in services ?? [] {

                    let jsonData = try? JSONSerialization.data(withJSONObject: service)

                    let service: Service = try! JSONDecoder().decode(Service.self, from: jsonData!)

                    firmDetails.services.append(service)
                }
                
                for master in masters ?? [] {

                    let jsonData = try? JSONSerialization.data(withJSONObject: master)

                    let master: Master = try! JSONDecoder().decode(Master.self, from: jsonData!)

                    firmDetails.masters.append(master)
                }
                
                for category in categories ?? [] {

                    let jsonData = try? JSONSerialization.data(withJSONObject: category)

                    let category: Category = try! JSONDecoder().decode(Category.self, from: jsonData!)

                    firmDetails.categories.append(category)
                }
                
                if let location = data?["location"] as? [String: Any] {
                    let jsonData = try? JSONSerialization.data(withJSONObject: location)

                    let location: Location = try! JSONDecoder().decode(Location.self, from: jsonData!)
                    
                    firmDetails.location = location
                }
                
                if let firm = data?["firm"] as? [String: Any] {
                    let jsonData = try? JSONSerialization.data(withJSONObject: firm)

                    let firm: Firm = try! JSONDecoder().decode(Firm.self, from: jsonData!)
                    
                    firmDetails.firm = firm
                }
                
                successAction(firmDetails)
            case .failure(let error):
                print("error from server: ", error)
            }
        }
    }
}
