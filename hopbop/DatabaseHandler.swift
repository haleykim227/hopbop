//
//  DatabaseProvider.swift
//  hop&bop
//
//  Created by Amy Sywe on 7/29/19.
//  Copyright © 2019 Haley Kim. All rights reserved.
//

import Foundation

class DatabaseHandler{
    
    // USER
    
    // Adds new user to the user table.
    func addNewUser(userID: String, platform: String, name: String, profilePic: String) {
        
    }
    
    // Returns current user's info.
    func getUserInfo(userID: String, platform: String) {
        
    }
    
    // Updates user info in user table.
    func updateUserInfo(userID: String, platform: String, name: String, profilePic: String) {
        
    }
    
    // Update user's last rating.
    func updateUserLastRating(userID: String, platform: String) {
        
    }
    
    // Returns if user's last rating was within 24 hours.
    func isLastRatingWithin24Hours(userID: String, platform: String) -> Bool {
        return true
    }
    
    // EVENT
    
    // Returns event info by event ID.
    func getEventByID(eventID: String) {
        
    }
    
    // Add new event.
    func addNewEvent(eventName: String, locationName: String, address: String, startTime: Date, endTime: Date) {
        
    }
    
    // Updates event info by event ID.
    func updateEventByID(eventID: String, eventName: String, locationName: String, address: String, startTime: Date, endTime: Date) {
        
    }
    
    // Returns array of event ID's in order of their ranking.
    func getEventIDsByRanking() -> [String]{
        return []
    }
    
    // Searches for an event by term, and returns the event.
    func searchForEventByTerm(term: String) {
        
    }
    
    // Returns ratings for event with the eventID.
    func getRatingsForEvent(eventID: String) {
        
    }
    
    // Returns array of markers for all events tonight.
    func getMarkersForTonight() -> [EventMarker] {
        return [EventMarker(id: "12345")]
    }
    
    // RATING
    
    // Returns rating with associated rating ID.
    func getRatingByID(ratingID: String) {
        
    }
    
    // Returns rating for the current user.
    func getRatingForUser(userID: String, platform: String) {
        
    }
    
    
}
