import Cocoa


class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

class Image {
    var filename: String
    var isAnimated: Bool
    init(filename: String, isAnimated: Bool) {
        self.filename = filename
        self.isAnimated = isAnimated// self. to distinguish the properties
    }
}

class Employee {
    let hours: Int
    init(hours: Int) {
        self.hours = hours
    }
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}
class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) a day. but other times will spend hours arguing about whether code should be indented using tabs or spaces")
    }
}
final class Manager: Employee {
    func work() {
        print("I'm going to meeting for \(hours) hours.")
    }
}

let robert =  Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()

let novall = Developer(hours: 8)
novall.printSummary()

class Vehicle {
    let isElectiric: Bool
    init(isElectric: Bool) {
        self.isElectiric = isElectric
    }
}
class Car: Vehicle {
    let isConvertible: Bool
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let teslaX = Car(isElectric: true, isConvertible: false)

class User {
    var username = "Anonymous"
}

var user1 = User()
var user2 = user1
user2.username =  "Taylor"
print(user1.username) // Taylor
print(user2.username) // Taylor
 //if class -> struct, user1.username ==  Anonymous, user2.username == Taylor

class User1 {
    var username1 = "Anonymous1"
    
    func copy() -> User1 {
        let user1 = User1()
        user1.username1 = username1
        return user1
    }
}
// if move 'copy()' inside 'User'class,
var user3 = User1()
var user4 = user3.copy()
user4.username1 = "Taylor1"
print(user3.username1) // Anonymous
print(user4.username1) // Taylor


class User5 {
    var name5 = "Paul"
}
let user5 = User5()
user5.name5 = "Taylor"
print(user5.name5)



class Animal {
    var legs : Int
    static var tot_count = 0 //Animal이라는 클래스 전체에 쓰이는 객체임. 동물 각각에 쓰이지 않기 때문에 static을 사용.
    init (legs: Int){
        self.legs = legs
        Animal.tot_count += 1
    }
    
    func speak() {
        print("Animal")
    }

}

class Dog: Animal {
    static var dog_list = [Dog]()
    
    override func speak() {
        print("Dog")
    }
    override init(legs: Int){
        super.init(legs: legs)
        Dog.dog_list.append(self)
    }
}

class Cat: Animal {
    var isTame: Bool
    static var cat_list = [Cat]()
    override func speak () {
        print("Cat")
    }
    init(tame: Bool,legs: Int){
        self.isTame = tame
        super.init(legs: legs)
        Cat.cat_list.append(self)
    }
    
}

class Corgi: Dog {
    override func speak() {
        print("Corgi")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Poodle")
    }
}
class Persian: Cat {
    override func speak() {
        print("Persian")
    }
}
class Lion: Cat {
    override func speak() {
        print("Lion")
    }
}

let corgi = Corgi(legs: 4)
corgi.speak()
let poodle = Poodle(legs: 4)
poodle.speak()
let persian = Persian(tame: true, legs: 4)
persian.speak()

let lion = Lion(tame: false, legs: 4)
lion.speak()

print("Total animale: \(Animal.tot_count)")
