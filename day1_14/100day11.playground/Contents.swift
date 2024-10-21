import Cocoa
import Foundation

/*
 private : Don't let anything outside the struct use this.
 fileprivate : Don't let anything outside the current file use this.
 public : Let anyone, anywhere use this.
 private(set) : Let anyone reat this property, but only let my methods write it.
 */
struct BankAccount {
    private(set) var funds = 0
    mutating func deposit(amount: Int) {
        funds += amount
    }
    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount{
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money succeddfully.")
} else {
    print("Failed to get the money")
}

struct School {
    static var studentCount = 0
    
    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}
School.add(student: "Taylor Swift")
print(School.studentCount)
// exist only struct itself. don't need  mutating

print(self.studentCount)
// self : The current value of a struct ex) 55, "Hello", true
// Self : The current type of struct ex) Int, String, Bool

struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

struct Employee {
    let username: String
    let password: String
    static let example = Employee(username: "sefdrighi", password: h4ir0rcr0ne)
}

struct Person {
    static var population = 0
    var name: String
    init(personName: String) {
        name = personName
        Person.population += 1
    }
}

struct Car {
    let model: String
    let numberOfSeats: Int
    private(set) var gear = 1
    
    mutating func changeGear(gearchange : Bool) {
        if gear > 1 && gear < 10 {
            if gearchange {
                gear += 1
            } else {
                gear -= 1
            }
        } else {
            print("gear outbounds")
        }
    }
}

