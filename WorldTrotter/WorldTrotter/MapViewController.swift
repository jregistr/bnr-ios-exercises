//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Registre, Jeff on 2/12/20.
//  Copyright © 2020 Registre, Jeff. All rights reserved.
//

import UIKit
import MapKit

class MapViewController : UIViewController {
        
    @IBOutlet
    var mapView: MKMapView!
    @IBOutlet
    var segControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Map view did just load bruuuh!")
        segControl.addTarget(self, action: #selector(mapTypeChanged(_:)), for: .valueChanged)
        mapView.pointOfInterestFilter = MKPointOfInterestFilter(including: [MKPointOfInterestCategory.restaurant])
    }
    
    @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        default:
            mapView.mapType = .satellite
        }
    }
}
