//
//  Order.swift
//  CupcakeCorner
//
//  Created by 최정안 on 9/26/24.
//

import Foundation

@Observable
class Order: Codable {
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _city = "city"
        case _streetAddress = "streetAddress"
        case _zip = "zip"
    }
    
    static let types = ["Vanilla","Strawberry", "Chocolate","Rainbow"]

    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    var extraFrosting = false
    var addSprinkles = false
    
    var name: String {
        didSet {
            UserDefaults.standard.set(name, forKey: "Name")
        }
    }
    var streetAddress: String {
        didSet {
            UserDefaults.standard.set(name, forKey: "StreetAddress")
        }
    }
    var city: String {
        didSet {
            UserDefaults.standard.set(name, forKey: "City")
        }
    }
    var zip: String {
        didSet {
            UserDefaults.standard.set(name, forKey: "Zip")
        }
    }
    
    var hasValidAddress: Bool {
        if name.trimmingCharacters(in: .whitespaces).isEmpty || streetAddress.trimmingCharacters(in: .whitespaces).isEmpty || city.trimmingCharacters(in: .whitespaces).isEmpty || zip.trimmingCharacters(in: .whitespaces).isEmpty {
            return false
        }
        return true
    }
    
    var cost: Decimal {
        // $2 per cake
        var cost = Decimal(quantity) * 2
        
        // complicated cakes cost more
        cost += Decimal(type) / 2
        
        // 1$/cake for extra frosting
        if extraFrosting {
            cost += Decimal(quantity)
        }
        // $0.5/cake for sprinkles
        if addSprinkles {
            cost += Decimal(quantity) / 2
        }
        return cost
    }
    
    init() {
            self.name = UserDefaults.standard.string(forKey: "Name") ?? ""
            self.streetAddress = UserDefaults.standard.string(forKey: "StreetAddress") ?? ""
            self.city = UserDefaults.standard.string(forKey: "City") ?? ""
            self.zip = UserDefaults.standard.string(forKey: "Zip") ?? ""
        }
}
