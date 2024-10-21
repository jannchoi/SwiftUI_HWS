import Cocoa

var greeting = "Hello, playground"
var name = "Ted"
name = "Rebecca"
name = "keeley"

let character = "Daphne"
var playerName = "Roy" // playerName != playername

print(playerName)

playerName = "Dani"
print(playerName)
playerName = "Sam"
print(playerName)

let filename = "Paris.jpg"

let actor = "Denzel Washington"
let quote = "Then he tapped a sign saying \"Believe\" and walked away."
let movie = """
A day in
the life of an
Apple enginner
"""
// THe final three quotes must be on a line by themselves.
let namelength = actor.count
print(namelength)

print(actor.uppercased())

print(movie.hasPrefix("A day")) //false if "a day"
print(filename.hasSuffix(".jpg"))

let score = 10
let reallyBig = 100_000___000 //  Swift ignores underscores

let lowerScore = score - 2
let higherScore = score + 10
let doubleScore = score * 2
let halvedScore = score / 2

var counter = 10
counter += 5
print(counter)

counter += 2
counter -= 10

let number = 120
print(number.isMultiple(of: 3))
print(120.isMultiple(of: 3))

let point = 0.1 + 0.2
print(point)

let a = 1
let b = 2.0
// let c = a + b : wrong You cannot mix types of data
let c = a + Int(b)
let d = Double(a) + b

let double1 = 3.1
let double2 = 3131.3131
let double3 = 3.0
let in1 = 3

var name1 = "Nicolas Cage"
// name1 = 57 : wrong

var rating = 5.0
rating *= 2


