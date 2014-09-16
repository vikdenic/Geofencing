//
//  ViewController.swift
//  GeoTesting
//
//  Created by Johnny Appleseed on 9/16/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    let locationManager = CLLocationManager()
    var location = CLLocation()
    @IBOutlet var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestAlwaysAuthorization()
        mapView.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }

    @IBAction func updateLocation(sender: UIBarButtonItem) {
        let spanX = 0.58
        let spanY = 0.58
        location = locationManager.location
        println("Received location:\(location.description)")
        let region = MKCoordinateRegion(center: CLLocationCoordinate2DMake(locationManager.location.coordinate.latitude, locationManager.location.coordinate.longitude), span: MKCoordinateSpanMake(spanX, spanY))
        mapView.setRegion(region, animated: true)
    }

    @IBAction func monitorThisRegion(sender: UIBarButtonItem) {
        let center = CLLocationCoordinate2D(latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude)

        locationManager.startMonitoringForRegion(CLCircularRegion(circularRegionWithCenter: center, radius: 20.0, identifier: "MMChicago"))
    }

    func locationManager(manager: CLLocationManager!, didEnterRegion region: CLRegion!) {
        println("welcome")
    }

    func locationManager(manager: CLLocationManager!, didExitRegion region: CLRegion!) {
        println("bye")
    }

    func locationManager(manager: CLLocationManager!, didStartMonitoringForRegion region: CLRegion!) {
        println("monitoring...")
    }
}

