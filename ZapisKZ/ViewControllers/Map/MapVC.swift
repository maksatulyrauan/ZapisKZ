//
//  MapVC.swift
//  ZapisKZ
//
//  Created by Rauan on 5/12/20.
//  Copyright © 2020 Rauan. All rights reserved.
//

import UIKit
import YandexMapKit

class MapVC: UIViewController {
    
    var location: Location?
    
    lazy var mapView = YMKMapView()
    
    private let FONT_SIZE: CGFloat = 15
    private let MARGIN_SIZE: CGFloat = 3
    private let STROKE_SIZE: CGFloat = 3
    
    var collection: YMKClusterizedPlacemarkCollection?

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(false, animated: false)
        
        setupBackground()
        setupViews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let TARGET_LOCATION = YMKPoint(latitude: Double(location?.centerX ?? 43.2220), longitude: Double(location?.centerY ?? 76.8512))
        
        mapView.mapWindow.map.move(
            with: YMKCameraPosition.init(target: TARGET_LOCATION, zoom: Float(location?.zoom ?? 15), azimuth: 0, tilt: 0),
        animationType: YMKAnimation(type: YMKAnimationType.smooth, duration: 1), cameraCallback: nil)
        
        let collection = mapView.mapWindow.map.mapObjects.addClusterizedPlacemarkCollection(with: self)

        
        //TODO: Marker size
        if let location = location {
            
            let latitude = location.markerX!
            let longitude = location.markerY!
            
            collection.addPlacemarks(with: [YMKPoint(latitude: Double(latitude), longitude: Double(longitude))], image: #imageLiteral(resourceName: "location"), style: YMKIconStyle())

            collection.clusterPlacemarks(withClusterRadius: 20, minZoom: 5)
        }
        
    }
    
    
    private func setupBackground() {
        
    }
    
    private func setupViews() {
        view.addSubview(mapView)
        
        mapView.snp.makeConstraints { (make) in
            make.left.top.right.bottom.equalToSuperview()
        }
    }

    func onClusterAdded(with cluster: YMKCluster) {
        // We setup cluster appearance and tap handler in this method
        cluster.appearance.setIconWith(clusterImage(cluster.size))
        cluster.addClusterTapListener(with: self)
    }
}
extension MapVC: YMKMapObjectTapListener, YMKClusterListener, YMKClusterTapListener {
    
    
    func onMapObjectTap(with mapObject: YMKMapObject, point: YMKPoint) -> Bool {
        guard let userPoint = mapObject as? YMKPlacemarkMapObject else {
            return true
        }

        print(userPoint.userData as Any)
        return true
    }
    
    
    
    func clusterImage(_ clusterSize: UInt) -> UIImage {
        let scale = UIScreen.main.scale
        let text = (clusterSize as NSNumber).stringValue
        let font = UIFont.systemFont(ofSize: FONT_SIZE * scale)
        let size = text.size(withAttributes: [NSAttributedString.Key.font: font])
        let textRadius = sqrt(size.height * size.height + size.width * size.width) / 2
        let internalRadius = textRadius + MARGIN_SIZE * scale
        let externalRadius = internalRadius + STROKE_SIZE * scale
        let iconSize = CGSize(width: externalRadius * 2, height: externalRadius * 2)

        UIGraphicsBeginImageContext(iconSize)
        let ctx = UIGraphicsGetCurrentContext()!

        ctx.setFillColor(UIColor.red.cgColor)
        ctx.fillEllipse(in: CGRect(
            origin: .zero,
            size: CGSize(width: 2 * externalRadius, height: 2 * externalRadius)));

        ctx.setFillColor(UIColor.white.cgColor)
        ctx.fillEllipse(in: CGRect(
            origin: CGPoint(x: externalRadius - internalRadius, y: externalRadius - internalRadius),
            size: CGSize(width: 2 * internalRadius, height: 2 * internalRadius)));

        (text as NSString).draw(
            in: CGRect(
                origin: CGPoint(x: externalRadius - size.width / 2, y: externalRadius - size.height / 2),
                size: size),
            withAttributes: [
                NSAttributedString.Key.font: font,
                NSAttributedString.Key.foregroundColor: UIColor.black])
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        return image
    }
    
    func onClusterTap(with cluster: YMKCluster) -> Bool {
        print("Tapped")
        let alert = UIAlertController(
            title: "Tap",
            message: String(format: "Tapped cluster with %u items", cluster.size),
            preferredStyle: .alert)
        alert.addAction(
            UIAlertAction(title: "OK", style: .default, handler: nil))

        present(alert, animated: true, completion: nil)

        // We return true to notify map that the tap was handled and shouldn't be
        // propagated further.
        return true
    }
}
