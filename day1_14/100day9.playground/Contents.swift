import Cocoa

let sayHello = {
    print("Hi there")
}
sayHello()

let sayHello1 = {(name: String) -> String in
    "Hi \(name)"
}

func greetUser() {
    print("Hi ther")
}

var greetCopy: () -> Void = greetUser
// () : 매개 변수가 없음
// -> void : 반환 타입이 없음
// greetCopy를 호출하면 greetUser 함수가 실행

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})// 알파벳 순서로 정렬하되, "Suzanne"가 제일 앞에 오도록

/*
 let closure = { (person name: String) ins
    print("Hello, \(name)"
 }
 클로저는 외부 매개변수(Person)을 사용할 수 없음.
 */

let sorted = team.sorted { a, b in
    if a == "Suzanne" {
        return true
    } else if b == "Suzanne" {
        return false
    }
    return a < b
}
let sorted1 = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }
    return $0 < $1
}

let reverseTeam = team.sorted {
    return $0 > $1
}

let leverseTeam1 = team.sorted{ $0 > $1}

let tOnly = team.filter { $0.hasPrefix("T")}
print(tOnly)

let uppercaseTeam = team.map { $0.uppercased()}
print(uppercaseTeam)

func makeArray(size: Int, using generator: () -> Int ) -> [Int]{
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    return numbers
}
// generator은 매개변수 없이 호출되어 정수를 반환하는 클로저
// 클로저 안에 클로저가 있을 수 있음

let rolls = makeArray(size: 50){
    Int.random(in: 1...20)
}

print(rolls)

func generateNumber() -> Int {
    Int.random(in: 1...20)
}

let newRolls = makeArray(size: 50, using: generateNumber)

print(newRolls)

func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("first")
    first()
    print("second")
    second()
    print("third")
    third()
    print("Done")
}
doImportantWork {
    print("first")
} second: {
    print("secodn")
} third: {
    print("third")
}

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
let oddNumbers = luckyNumbers.filter {!$0.isMultiple(of: 2)}
let sortedNumbers = oddNumbers.sorted()
let stringNumbers = sortedNumbers.map { "\($0) is a lucky number"}
for i in stringNumbers {
    print(i)
}
