
//
//  DataStore.swift
//  WhereWasI
//
//  Created by Александр Слатинин on 14/04/2025.
//
import Foundation

struct StorageKeys{
    static let storedLatitude = "storedLatitude"
    static let storedLongitude = "storedLongitude"
}

class DataStore {
    
    func storeLocation(latitude: String, longitude: String) {
        let defaults = getUserDefaults()
        defaults.setValue(latitude, forKey: StorageKeys.storedLatitude)
        defaults.setValue(longitude, forKey: StorageKeys.storedLongitude)
        defaults.synchronize()
    }
    
    func getUserDefaults()->UserDefaults{
        return UserDefaults.standard
    }
    
    func getLastLocation() -> VisitedPoint? {
        let defaults = getUserDefaults()
        guard let latitude = defaults.string(forKey: StorageKeys.storedLatitude),
              let longitude = defaults.string(forKey: StorageKeys.storedLongitude)
        else {
            return nil
        }
        return VisitedPoint(latitude: latitude, longitude: longitude)
    }
}
