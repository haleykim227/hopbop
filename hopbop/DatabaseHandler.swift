//
//  DatabaseProvider.swift
//  hop&bop
//
//  Created by Amy Sywe on 7/29/19.
//  Copyright © 2019 Haley Kim. All rights reserved.
//

import Foundation

class DatabaseHandler {
    
    // USER
    
    // Adds new user to the user table.
    static func addNewUser(userID: String, platform: String, name: String, profilePic: String) {
        
    }
    
    // Returns current user's info.
    static func getUserInfo(userID: String, platform: String) {
        
    }
    
    // Updates user info in user table.
    static func updateUserInfo(userID: String, platform: String, name: String, profilePic: String) {
        
    }
    
    // Update user's last rating.
    static func updateUserLastRating(userID: String, platform: String) {
        
    }
    
    // Returns if user's last rating was within 24 hours.
    static func isLastRatingWithin24Hours(userID: String, platform: String) -> Bool {
        return true
    }
    
    // EVENT
    
    // Returns event info by event ID.
    static func getEventByID(eventID: String) {
        
    }
    
    // Add new event.
    static func addNewEvent(eventName: String, locationName: String, address: String, startTime: Date, endTime: Date) {
        
    }
    
    // Updates event info by event ID.
    static func updateEventByID(eventID: String, eventName: String, locationName: String, address: String, startTime: Date, endTime: Date) {
        
    }
    
    // Returns array of event ID's in order of their ranking.
    static func getEventIDsByRanking() -> [String] {
        return []
    }
    
    // Returns number of events tonight.
    static func getNumEvents() -> Int {
        return 1
    }
    
    // Searches for an event by term, and returns the event.
    static func searchForEventByTerm(term: String) {
        
    }
    
    // Returns ratings for event with the eventID.
    static func getRatingsForEvent(eventID: String) {
        
    }
    
    // Returns array of markers for all events tonight.
    static func getMarkersForTonight() -> [EventMarker] {
        return [EventMarker(id: "12345")]
    }
    
    // RATING
    
    // Returns rating with associated rating ID.
    static func getRatingByID(ratingID: String) {
        
    }
    
    // Returns rating for the current user.
    static func getRatingForUser(userID: String, platform: String) {
        
    }
    
    
}
