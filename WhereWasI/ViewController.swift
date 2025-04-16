//
//  ViewController.swift
//  WhereWasI
//
//  Created by Александр Слатинин on 29/03/2025.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBAction func onClick(_ sender: UIBarButtonItem) {
        let coordinates = locationManager.location?.coordinate
        if let latitude =   coordinates?.latitude, let longitude = coordinates?.longitude {
            DataStore().storeLocation(latitude: String(latitude), longitude: String(longitude))
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(
                latitude: latitude,
                longitude: longitude
            )
            annotation.title = "Now I am here"
            mapView.addAnnotation(annotation)
            mapView.setCenter(annotation.coordinate, animated: true)
            
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
        
        if let savedLocation = DataStore().getLastLocation() {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(
                latitude: Double(savedLocation.latitude)!,
                longitude: Double(savedLocation.longitude)!
            )
            annotation.title = "I was here"
            mapView.addAnnotation(annotation)
        }
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        guard manager.authorizationStatus == .authorizedWhenInUse else { return }
        mapView.showsUserLocation = true
    }
}

