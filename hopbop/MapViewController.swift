//
//  MapViewController.swift
//  hop&bop
//
//  Created by Amy Sywe on 7/26/19.
//  Copyright © 2019 Haley Kim. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import GoogleSignIn
import GoogleMaps

class MapViewController: UIViewController, CLLocationManagerDelegate {
    // FB LoginManager
    let logOutManager = LoginManager()
    
    // GoogleMaps stuff
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    //var mapView: GMSMapView!
    var zoomLevel: Float = 15.0
    
    @IBOutlet weak var googleMapsView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Checks if FB user is logged in.
        if let fbUser = AccessToken.current {
            print("FB User: \(fbUser.userID)")
        }
        
        // Checks if Google user is logged in.
        if let googleUser = GIDSignIn.sharedInstance()?.currentUser {
            print("Google User: \(googleUser.authentication.accessToken!)")
        }
        
        // Do any additional setup after loading the view.
        
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 50
        locationManager.delegate = self
        
        // Creates default map view of Sydney, Australia.
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        //mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        //mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Sets the map as the view, hide it until we've got a location update.
        //view = mapView
        googleMapsView.isHidden = true
    }
    
    // Logs out.
    @IBAction func logOutPressed(_ sender: Any) {
        logOutManager.logOut()
        GIDSignIn.sharedInstance().signOut()
    }
    
    // CLLocationManagerDelegate Methods
    
    // Handle incoming location events.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        let camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
        print("Location: \(location)")
        
        if googleMapsView.isHidden {
            googleMapsView.isHidden = false
            googleMapsView.camera = camera
        } else {
            googleMapsView.animate(to: camera)
        }
    }
    
    // Handle authorization for the location manager.
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .restricted:
            print("Location access was restricted.")
        case .denied:
            print("User denied access to location.")
            // Display the map using the default location.
            googleMapsView.isHidden = false
        case .notDetermined:
            print("Location status not determined.")
        case .authorizedAlways: fallthrough
        case .authorizedWhenInUse:
            print("Location status is OK.")
            locationManager.startUpdatingLocation()
            googleMapsView.isMyLocationEnabled = true
            googleMapsView.settings.myLocationButton = true
        }
    }
    
    // Handle location manager errors.
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationManager.stopUpdatingLocation()
        print("Error: \(error)")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
