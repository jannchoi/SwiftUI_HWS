import Cocoa

let surname: String = "Lasso"
var score: Double = 0

let playerName: String = "Roy"
let luckyNumber: Int = 13
let pi: Double = 3.141
var isAuthenticated: Bool = true

var albums: [String] = ["Red", "Fearless"] // arrays has one specific type
var counts = albums.count
var album_set = Set(albums)
var user: [String: String] = ["id": "@twostraws"]
// dictionaries specialize to have one spcific type for the key and for the value.
var books: Set<String> = Set([
"The Bluest Eye",
"Foundation",
"Girl, Woman, Other"
]) // we don't get to chose the order in which they store those items
// set never include duplicates
var soda: [String] = ["Coke", "Pepsi", "Irn-Bru"]
var teams: [String] = [String]()
var cities: [String] = []
var clues = [String]()
//teams, cities, clues are doing same thing

enum UIStyle {
    case light, dark, system
}// enum create own simple types

var style: UIStyle = UIStyle.light
style = .dark

let username: String
// lots of complex logic
username = "@twostraws"
// username = "taylorswift13" <- wrong
print(username)

// let score: Int = "Zero" <-wrong

let names: [String] = ["Tom", "John","Tom"]
let nameCount = names.count
print(nameCount)
let name_set = Set(names)
print(name_set.count)
