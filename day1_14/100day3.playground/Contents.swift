import Cocoa


var beatles = ["John", "Paul", "George", "Ringo"]
var number = [4, 8, 15, 26, 23, 42]
var temperatures = [25.3, 28.2, 26.4]
// You cannot add sting into an array of decimals

// index starts with 0
print(beatles[0])

beatles.append("Adrian")// position at the end of the array

var scores = Array<Int>()
scores.append(100)
scores.append(80)

var albums = ["Folklore"]
albums.append("Fearless")
print(albums.count)

var characters = ["Lana","Pam","Ray","Sterling"]
print(characters.count)
characters.remove(at:2)// romove one item at a specific index
print(characters.count)
characters.removeAll()
print(characters.count)

let bondMovies = ["Casino", "Spectre", "No Time"]
print(bondMovies.contains("Frozen"))

let cities = ["London", "Tokyo", "Rome", "Budapest"]
print(cities.sorted())

let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()// 배열을 뒤집은 새로운 배열을 만드는 대신 원래 배열을 뒤집었다는 의미를 가진 'ReversedCollection'이라는 타입을 반환합
// 메모리 효율적으로 배열을 처리하기 위해 배열의 요소를 실제로 뒤집지 않고 필요한 시점에 뒤집힌 순서대로 요소에 접근하도록 함.
print(reversedPresidents)

let reversedArray = Array(reversedPresidents)//원래 배열처럼 이용
print(reversedArray)


let employee2 = [
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashville"
]

print(employee2["name", default: "Unknown"])
print(employee2["job", default: "Unknown"])
// 딕셔너리에서 키를 통해 값을 읽으려고 할 때 해당 키에 값이 존재하지 않을수도 있다는 가능성을 고려
// 만약 키가 없다면 'nil'을 반환. 딕셔너리 값 타입은 옵셔널로 반환
// Optional("value") 같은 형식으로 출력

let hasGraduated = [
    "Eric": false,
    "Maeve": true,
    "Otis": false
]

let olympics = [
    2012: "London",
    2016: "Rio de Janeiro",
    2021: "Tokyo"
 ]
print(olympics[2012, default: "Unknown"])

var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaquille"] = 216
heights["LeBron"] = 206
// particular key dictionaries don't allow duplicate keys to exist
// if already extist, it wil overwrite with the new value and discard the old value
heights["LeBron"] = 207


// the set does not care what order its items come in
var actors = Set<String>()
actors.insert("Denzel Washington")
actors.insert("Tom Cruise")
actors.insert("Nicolas Cage")
actors.insert("Samuel Jackson")
// set의 장점: 빠른 검색, 큰 데이터셋에서 특정 요소를 찾는 작업에서 성능이 좋다.
/*
 set의 메서드
 contains()
 count
 sorted : 셋의 요소를 정렬된 배열로 반환
 */

var selected = "Monday"
selected = "Tuesday"
selected = "January"
selected = "Friday " // != "Friday"

enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

var day = Weekday.monday
day = .tuesday
day = .friday
