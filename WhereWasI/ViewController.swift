//
//  ViewController.swift
//  WhereWasI
//
//  Created by Александр Слатинин on 29/03/2025.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    
    @IBAction func onAddLocationClicked(_ sender: Any) {
        let coordinates = locationManager.location?.coordinate
        if let latitude =   coordinates?.latitude, let longitude = coordinates?.longitude {
            
        }
    }
    @IBOutlet weak var mapView: MKMapView!
    
    private let locationManager: CLLocationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        guard manager.authorizationStatus == .authorizedWhenInUse else { return }
        mapView.showsUserLocation = true
    }
}

