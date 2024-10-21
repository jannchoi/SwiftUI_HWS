import Cocoa
import Darwin


struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let red = Album(title: "Red", artist: " Taylor Swift", year:2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()

struct Employee{
    let name: String
    var vacationRemaining: Int = 14
    
    mutating func takeVacation(days: Int){// method
        if vacationRemaining > days{
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        }
        else {
            print("Oops! There aren't enought days remaining")
        }
    }
}
var archer = Employee.init(name: "Sterling Archer", vacationRemaining: 30) //initialize
archer.takeVacation(days: 5)
print(archer.vacationRemaining)

let a = 1
let b = 2.0
let c = Double(a) + b

let kane = Employee(name: "Lana kane")

struct Employee1 {
    let name1: String
    var vacationAllocated1 = 14
    var vacationTaken1 = 0
    
    var vacationRemaining1: Int {
        get{
            vacationAllocated1 - vacationTaken1}
        set{
            vacationAllocated1 = vacationTaken1 + newValue}
    }
}

var archer1 = Employee1(name1: "Sterling Archer", vacationAllocated1: 14)
archer1.vacationTaken1 += 4
archer1.vacationRemaining1 = 5
print(archer1.vacationAllocated1)


struct Game {
    var score = 0{
        didSet{
            print("Score is now \(score)")
        }
    }
}
var game = Game()
game.score += 10
game.score -= 3
game.score += 1

struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is \(contacts)")
            print("New value will be: \(newValue)")
        }
        didSet {
            print("There are now \(contacts.count) contacts")
            print("Old value was: \(oldValue)")
        }
    }
}
var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")


struct Player {
    let name: String
    let number: Int
    
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}
let player = Player(name:"Megan R")
print(player.number)
// all properties must have a value by the time the initializer ends.
