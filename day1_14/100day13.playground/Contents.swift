import Cocoa

protocol Vehicle {
    var name: String {get}
    var currentPassengers: Int {get set}
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}
protocol CanBeElectric {
    
}
struct Car: Vehicle, CanBeElectric {
    let name = "Car"
    var currentPassengers = 1
    func estimateTime(for distance: Int) -> Int {
        distance/50
    }
    func travel(distance: Int) {
        print("I'm driving \(distance)km")
    }
    func openSunroof() {
        print("It's a nice day!")
    }
}

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

struct Bicycle: Vehicle {
    let name = "Bicycle"
    var currentPassengers = 1
    func estimateTime(for distance: Int) -> Int {
        distance/10
    }
    func travel(distance: Int){
        print("I'm cycling \(distance)km.")
    }
}

let car = Car()
commute(distance: 100, using: car)
let bike = Bicycle()
commute(distance: 50, using: bike)

func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}

getTravelEstimates(using: [car,bike], distance: 150)


func getrandomNumber() -> some Equatable {
    Double.random(in: 1...6)
}
func getRamdomBool() -> some Equatable {
    Bool.random()
}
// 'some'을 사용하면 코드의 유연성을 높일 수 있다.
// '비교'와 같은 타입에서는 구체적인 타입 정보가 필요하기 때문에 부적절하다.
print(getrandomNumber() == getrandomNumber())


var quote = "   The truth is rarely pure and never simple   "
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)
// trimmingCharacters(in:) : 문자열 앞뒤에 특정 문자를 제거하는 메서드
// ->"The truth is rarely pure and never simple"
extension String
{// String 타입에 기능(trimmed)을 추가하겠다.
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    mutating func trim() { // 메서드가 구조체 인스턴스의 상태를 변경해야하니까 mutating이 필요함.
        self = self.trimmed()
    }
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}
// extension : 기존 타입에 새로운 기능을 추가.

quote.trim()

let lyrics = """
But I keep cruising
Can't stop, won't stop movinf
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines.count)


struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

// 사용자 정의 생성자를 추가하는 확장
extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

// 기본 memberwise initializer 사용
let defaultBook = Book(title: "Swift Programming", pageCount: 300, readingHours: 6)

// 사용자 정의 생성자 사용
let customBook = Book(title: "Swift Programming", pageCount: 300)

// extension을 구조체에 사용하게 되면 구조체에 맴버별 생성자와 사용자 정의 생성자를 모두 사용할 수 있는 유연성을 제공한다.

extension Collection {
    var isNorEmpty: Bool {
        isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Peach"]
if !guests.isEmpty {
    print("Quest count: \(guests.count).")
}


protocol Person {
    var name: String { get}
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}

struct Employee: Person {
    let name: String
}
let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()


protocol Building {
    var rooms : Int {get set}
    var cost : Int {get set}
    var name : String {get}
    func printSummary()
}

struct House: Building {
    var rooms: Int
    var cost: Int
    let name: String
    func printSummary() {
        print("House name: \(name), Rooms: \(rooms), Cost: \(cost)")
    }
}

struct Office: Building {
    var rooms: Int
    var cost: Int
    let name: String
    func printSummary() {
        print("Office name: \(name), Rooms: \(rooms), Cost: \(cost)")
    }
}

let house1 = House(rooms: 4, cost: 250_000, name:"My House")
let office1 = Office(rooms: 8, cost: 300_000, name: "My office")
house1.printSummary()
office1.printSummary()
