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

class MapViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {
    // FB LoginManager
    let logOutManager = LoginManager()
    
    // GoogleMaps stuff
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var zoomLevel: Float = 15.0
    
    @IBOutlet weak var googleMapsView: GMSMapView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationController?.setNavigationBarHidden(true, animated: true)
        //tabBarController?.tabBar.isHidden = false
        
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
        
        // Sets the map as the view, hide it until we've got a location update.
        googleMapsView.delegate = self
        googleMapsView.isHidden = true
        
        // TODO: Create markers for all parties that are tonight and the end time hasn't passed yet. Database request!
        // Test add a GMS marker
        let markers = DatabaseHandler.getMarkersForTonight()
        for marker in markers {
            marker.map = googleMapsView
        }
        
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
    
    // GMSMapView Delegate Methods
    // If marker info is tapped, opens new view controller with rankings of event marker represents.
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let eventInfoVC = storyboard.instantiateViewController(withIdentifier: "eventInfoVC") as? EventInfoViewController else {
            print("'eventInfoVC' cannot be casted as EventInfoViewController")
            return
        }
        guard let evMarker = marker as? EventMarker else {
            print("Marker selected is not of class EventMarker")
            return
        }
        eventInfoVC.eventID = evMarker.eventID
        navigationController?.pushViewController(eventInfoVC, animated: true)
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
