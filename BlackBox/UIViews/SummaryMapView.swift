//
//  SummaryMapView.swift
//  BlackBox
//
//  Created by Anna Johnson on 11/8/22.
//

import UIKit
import MapKit

class SummaryMapView: MKMapView {
    
    let mapView : MKMapView = {
        let map = MKMapView()
        map.overrideUserInterfaceStyle = .dark
//        map.layer.cornerRadius = 10
        return map
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SummaryMapView : MKMapViewDelegate {
  //DELEGATE FUNCTIONS

}
