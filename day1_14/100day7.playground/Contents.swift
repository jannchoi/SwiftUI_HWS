import Cocoa

func printTimesTable(number: Int, end: Int){
    for i in 1...end {
        print("\(i) * \(number) is \(i * number)")
    }
}

printTimesTable(number: 5, end: 20)
//printTimeTable(end: 20, number: 5) : nor allowed

let root = sqrt(169)

func rollDice() -> Int {
    return Int.random(in: 1...6)
}
let result = rollDice()
print(result)

func matchString (s1: String, s2: String) -> Bool {
    let first = s1.sorted()
    let second = s2.sorted()
    return first == second
}


 func matchString2 (s1: String, s2: String) -> Bool {
    s1.sorted() == s2.sorted()
 } //Because Swift knows that this function must return a Boolean,
   //we can remove the return keyword when a function has only one line of code.
 

func pythaforas(a: Double, b: Double) -> Double {
    let input = a  * a + b * b
    let root = sqrt(input)
    return root
}

func pythagoras1(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}
let c = pythaforas(a: 3, b: 4)
print(c)


func isUppercaes(string: String) -> Bool {
    string == string.uppercased()
}

func getUser() -> (firstName: String, lastName: String){
    (firstName: "Taylor", lastName: "Swift")
}
let user = getUser()
print("Name: \(user.firstName) \(user.lastName)")

func getUser1() -> (firstName: String, lastName: String){
    ("Taylor", "Swift")
}

func getUser2() -> (String, String){
    ("Taylor", "Swift")
}
let user2 = getUser2()
print("Name: \(user2.0) \(user2.1)")



let (firstName, lastName) = getUser2()
print("Name: \(firstName) \(lastName)")

let user3 = getUser1()
let firstName3 = user3.firstName
let lastName3 = user3.lastName



func hireEmployee(name: String){}
func hireEmployee(title: String){}
func hireEmployee(location: String){}

func isUppercase1(_ string: String) -> Bool {
    string == string.uppercased()
}
let string = "HELLO, WORLD"
let result1 = isUppercase1(string)

func printTimeTable1(for number: Int){
    for i in 1...12{
        print("\(i) X \(number) is \(i * number)")
    }
}
printTimeTable1(for: 5)
