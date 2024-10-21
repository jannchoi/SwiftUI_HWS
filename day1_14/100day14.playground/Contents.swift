import Cocoa

let opposites = ["Mario": "Wario", "Luigi":"Waluigi"]
let peachOpposite = opposites["Peach"]

if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}

var username: String? = nil
// username은 옵셔널 변수. String 값을 가질 수 도있고, nil일 수도 있는데 이 경우는 nil
var username1: String? = "Alice"
if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}

/*
 굳이 옵셔널을 사용하는 이유는?
 만약 var username1 =  "Alice"로 옵셔널을 사용하지 않으면 변수에 값이 항상 있다는 전제가 깔리게 됨.
 사용자가 아직 앱에 로그인하지 않았을 때 'username'이 nil'일 수 있다. 
 이때 다른 값을 쓰거나 쓰레깃값을 쓰게되면 값이 없는건지 있는건지 불분명해짐.
 'if let' 이나 'guard let'을 사용해서 아정하게 'nil'인 경우를 처리할 수 있음.
 값이 없음을 명시해주는 것임.
 
 */
var str1 = "Hello"
var str2 = ""
var str3: String? = nil
// str2와 str3은 엄연히 다른 것. 빈 문자열과 값이 없음은 다르다.

var arr1 = [0]
var arr2 = [Int] ()
var arr3: [Int]? = nil
// arr2라는 변수 공간이 생기고 빈 'Int' 타입의 배열을 가리키고 해당 배열이 리스트임을 메모리에 저장.
// arr3은 'Int'타입의 배열을 옵셔널까지 합하여 '[Int]?' 변수로 정의. 아직 [Int] 배열을 위한 공간은 메모리에 할당되지 않음
// 하지만, 이 변수가 'nil'인지 배열인지를 가리키는 추가 정보가 메모리에 저장됨.(nil인지 실제 값인지)

func square (number: Int) -> Int {
    number * number
}

var number: Int? = nil
// print(square(number: number)) : wrong -> square이라는 함수는 실제 Int값을 입력으로 기대하는데 nil일 수도 있으니까
if let unwrappedNumber = number {
    print(square(number: unwrappedNumber))
}


let album = "Red"
let albums = ["Reputation", "Red", "1989"]
if let position = albums.firstIndex(of: album) {
    print("Found \(album) at position \(position).")
}// 옵셔널을 사용하지 않아도 옵셔널 바인딩을 사용할 수 있음. 메서드의 값이 nil일 수도 있으니까.


func printSqquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")// if the number is nil
        return
    }
    print("\(number) x \(number) is \(number * number)")
}

// if let runs code if the optional has a value
// guard let runs code if the optional doesn't have a value



var myVar: Int? = 3

let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity"] ?? "N/A"
// captains에서 "Serenity" 키에 해당하는 값을 가져오는데 만약에 값이 존재하지 않으면 nil으로 "N/A"를 반환

let tvShows = ["Archer", "Babylon", "Ted"]
let favorite = tvShows.randomElement() ?? "None"
//만약 tvShows가 비어있다면 nil으로 "None"을 반환

struct Book {
    let title: String
    let author: String?
    
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)

let input = ""
let number1 = Int(input) ?? 0
print(number1)

let distanceRan: Double? = 0.5
let distance: Double = distanceRan ?? 0
// 만약 nil이라면 Swift가 자동으로 추론해서 Double값인 0.0을 반환

let names = ["Arya", "Bran", "Robb", "Sansa"]
let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")


var book2: Book? = nil
let auther = book2?.author?.first?.uppercased() ?? "A"
print(author)

let attendees: [String] = [String]()
let firstInLine = attendees.first?.uppercased()
// 첫번째 줄 때문에 attendees는 옵셔널을 필요로 하지 않음
// 만약 첫번째 줄이 var attendees: [String]? = nil이라면 옵셔널이 필요함

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User \(user)")
    
}

let user1 = (try? getUser(id: 23)) ?? "Anonymous"
//'getUser가 싫패하면 "Anonymou"가 기본값으로 사용됨. 오류를 무시하고 결과만 확일할 때 사용

//checkpoint9
func randomInteger(of numberArr: [Int]?)-> Int {
    return numberArr?.randomElement() ?? Int.random(in: 1...100)
}
