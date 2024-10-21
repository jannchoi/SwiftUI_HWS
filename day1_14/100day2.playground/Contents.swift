import Cocoa

let goodDogs = true
var gameOver = false
print(gameOver)
gameOver.toggle()
print(gameOver)
let isMultiple = 120.isMultiple(of: 3)

var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)

let firstPart = "Hello, "
let secondPart = "world!"
let greeting = firstPart + secondPart

let people = "Haters"
let action = "hate"
let lylic = people + " gonna " + action

let luggageCode = "1" + "2" + "3" + "4" + "5"
let luggageCode1 = "12345"

let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I'm \(age) years old"
print(message)

// let wrong = "Apollo" + age + " years old" : not allowed

let missionMessage = "Apollo" + String(age) + "yeas old"

print("5 x 5 is \(5*5)")

let Celsius = 30
let Fahrenheit = (Celsius * 9 / 5) + 32
print("Celsius : \(Celsius), Fahrenheit : \(Fahrenheit)")
