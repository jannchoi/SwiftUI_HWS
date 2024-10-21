import Cocoa

let score = 85
if score > 80 {
    print("Great job!")
}

let speed = 88
let percentage = 85
let age = 18

if speed >= 88 {
    print(" where we're going, we don't need roads")
}

if percentage < 85 {
    print("Sorry, you failed the test.")
}

if age >= 18 {
    print("You're eligible to vote")
}

let ourName = "Dave Lister"
let friendName = "Arnold Rimmer"

if ourName < friendName {
    print("It's \(ourName) vs \(friendName)")
}

if friendName < ourName {
    print("It's \(friendName) vs \(ourName)")
}

var numbers = [1, 2, 3]
numbers.append(4)
if numbers.count > 3{
    numbers.remove(at:0)
}
 print(numbers)

let country = "Canada"

if country == "Australia" {
    print("G'day")
}

let name = "Taylor swift"

if name != "anonymous"{
    print("Welcome, \(name)")
}

var username = "taylorswift13"

if username == "" {// If 'username' is an empty string, Make it equal to "Anonymous"
    username = "Anonymous"
}
if username.count == 0 {
    username = "Anonymous"
}
if username.isEmpty {
    username = "Anonymous"
}
print("Welcome, \(username)")


if username.count == 0 { // username is empty == if username.isEmpty == true
    print("\(username) count")
}


//multiple conditions

let age1 = 16
if age1 > 18 {
    print("youcan vote in the next election.")
} else {
    print("Sorry, you're too young to vote.")
}
/*
 if a {
    print("Code to run if a is true")
} else if b {
    print("Code to run if a is false but b is  true")
} else{
    print("Code to run if both a and b are false")
}
*/

let temp = 25
if temp > 20 {
    if temp < 30 {
        // == if temp > 20 && temp < 30
        print("It's a nice day.")
    }
}

let userAge = 14
let hasParentalConsent = true
if userAge >= 18 || hasParentalConsent == true {
    print("You can buy the game!")
}


enum TransportOption {
    case airplane, helicopter, bicycle, car, escooter
}
let transport = TransportOption.airplane
// we can't just write .airplane because Swift doesn't understand we mean the TransportOption enum.
// Once that has happened, we don't need to write TransportOption any more
if transport == .airplane || transport == .helicopter {
    print("Let's fly!")
} else if transport == .bicycle {
    print("I hope there's a bike path...")
} else if transport == .car {
    print("Time to get stuck in traffic.")
} else {
    print("I'm going to hire a scooter now!")
}

// Only can compare same types

enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun
switch forecast {
case .sun:
    print("It should be a nice day.")
case .rain:
    print("Pack an umbrella.")
case .wind:
    print("Wear something warm.")
case .snow:
    print("School is cancelled")
case .unknown:
    print("Our forecast generator is broken!")
}

let place = "Metropolis"

switch place{
case "Gotham":
    print("You're Batman")
case "Mega-City One":
    print("You're Judge Dredd")
case "Wakanda":
    print("You're Black Panther")
default:// if all cases have failed to match
    print("Who are you?")
}

let day = 5
print("My true love gave to me…")

switch day {
case 5:
    print("5 golden rings")
case 4:
    print("4 calling birds")
case 3:
    print("3 French hens")
case 2:
    print("2 turtle doves")
default:
    print("A partridge in a pear tree")
}

let day1 = 5
print("My true love gave to me…")

switch day1 {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}


let age2 = 18

let canVote = age2 >= 18 ? "Yes" : "No"

let hour = 23
print(hour < 12 ? "It's before noon" : "It's after noon")

let names = ["Jatne", "kaylee", "Mal"]
let crewCount = names.isEmpty ? "No one" : "\(names.count) people"

enum Theme {
    case light, dark
}
let theme = Theme.dark
let background = theme == .dark ? "black" : "white"
print(background)
