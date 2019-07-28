//
//  Marker.swift
//  hop&bop
//
//  Created by Amy Sywe on 7/28/19.
//  Copyright © 2019 Haley Kim. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

class Marker: GMSMarker {
    let eventID: String
    //let eventName: String
    let startTime: Date    // Not sure if this should be of type Date
    let endTime: Date
    let photo: UIImage
    let address: String
    
    init(id: String) {
        
        eventID = id
        
        // TODO: Fill in rest of fields with requests to database.
        
        // Temporary values:
        startTime = Date()
        endTime = Date()
        photo = UIImage()
        address = "Haley's dorm!"
        
        super.init()
        title = "Party!"
        // set position
        position = CLLocationCoordinate2D(latitude: 37.32493116, longitude: -122.01838011)
        snippet = "address"
    }
}
