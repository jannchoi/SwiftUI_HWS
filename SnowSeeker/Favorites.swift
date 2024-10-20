//
//  Favorites.swift
//  SnowSeeker
//
//  Created by 최정안 on 10/20/24.
//

import SwiftUI

@Observable
class Favorites {
    private var resorts: Set<String>
    private let key = "Favorites"
    
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "Resorts") {
            if let decoded = try? JSONDecoder().decode(Set<String>.self, from: data) {
                resorts = decoded
            } else {
                resorts = []
            }
        } else {
            resorts = []
        }
    }
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort) {
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort) {
        resorts.remove(resort.id)
        save()
    }
    func save() {
        if let data = try? JSONEncoder().encode(resorts){
            UserDefaults.standard.set(data, forKey: "Resorts")
        }
    }
}
