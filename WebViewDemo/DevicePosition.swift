//
//  DevicePosition.swift
//  stuff
//
//  Created by comps on 2/6/15.
//

import Foundation
import Darwin
import CoreMotion
import CoreLocation

class DevicePosition {
    //Multipliers based on
    let latMultiplier: Double = 111000
    let lonMultiplier: Double = 79000
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    var altitude: Float = 0.0
    var pitch: Float = 0.0
    var roll: Float = 0.0
    var yaw: Float = 0.0
    var hasPosition = false
    var queriedLatitude: Double = 0.0
    var queriedLongitude: Double = 0.0
    
    var pi = M_PI
    

    func getValues() -> (latitude: Double, longitude: Double, altitude: Float, pitch: Float, roll: Float, yaw: Float) {
        return (latitude, longitude, altitude, pitch, roll, yaw)
    }
    
    func getQueriedValues() -> (latitude: Double, longitude: Double) {
        return (queriedLatitude, queriedLongitude)
    }
     
    func getStringValues() -> (latitude: NSString, longitude: NSString, altitude: NSString, pitch: NSString, roll: NSString, yaw: NSString) {
        return
            (String(format: "%f",latitude),
            String(format: "%f",longitude),
            String(format: "%f",altitude),
            String(format: "%f",pitch),
            String(format: "%f",roll),
            String(format: "%f",yaw))
    }
    
    func setLocation(location: CLLocation?) {
        if (location != nil) {
            self.setLatitude(Double(location!.coordinate.latitude * latMultiplier))
            self.setLongitude(Double(location!.coordinate.longitude * lonMultiplier))
            self.setAltitude( Float(location!.altitude))
            
            //Test values for scaling stuff
            /*self.setLatitude(444625.6)
            self.setLongitude(-931536.9)
            self.setAltitude(285)*/
            self.hasPosition = true
        }
    }
    
    func setQueriedLocation(location: CLLocation?) {
        if (location != nil) {
            self.setQueriedLatitude(Double(location!.coordinate.latitude * 1000))
            self.setQueriedLongitude(Double(location!.coordinate.longitude * 1000))
        }
    }
    
    func setPosition(latitude: Double, longitude: Double, altitude: Float)  {
        setLatitude(latitude)
        setLongitude(longitude)
        setAltitude(altitude)
        //setAltitude(270)
        if !hasPosition {
            setHasPosition(true)
        }
    }
    
    func setAttitude(attitude: CMAttitude?) {
        if (attitude != nil) {
            self.setPitch(Float(attitude!.pitch))
            //self.setPitch(Float(pi/2))
            self.setRoll(Float(pi/2))
            self.setYaw(0)
            self.setRoll(Float(attitude!.roll))
            //self.setYaw(Float(attitude!.yaw))
        }
    }
    
    func setLatitude (latitude: Double) {
        self.latitude = latitude
    }
    
    func setLongitude (longitude: Double) {
        self.longitude = longitude
    }
    
    func setAltitude (altitude: Float) {
        self.altitude = altitude
    }
    
    func setPitch (pitch: Float) {
        self.pitch = pitch
    }
    
    func setRoll (roll: Float) {
        self.roll = roll
    }
    
    func setYaw (yaw: Float) {
        self.yaw = yaw
    }
    
    func setHasPosition(hasPosition: Bool) {
        self.hasPosition = hasPosition
    }
    
    func setQueriedLatitude (latitude: Double) {
        self.queriedLatitude = latitude
    }
    
    func setQueriedLongitude (longitude: Double) {
        self.queriedLongitude = longitude
    }
}