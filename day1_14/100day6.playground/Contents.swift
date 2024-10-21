import Cocoa

let platforms = ["iOs", "macOS", "tvOS", "watchOS"]
 
for os in platforms {//os : loop variable
    print("Swift works great on \(os).")
}

for i in 1...12 { // 1 <= i <= 12
    print("5 x \(i) is \(5 * i)")
}

for i in 1...12 {
    print("This is \(i) times table")
    for j in 1...12 {
        print("   \(j) x \(i) is \(j * i)")
    }
    print()
}

for i in 1..<5 { // 1,2,3,4
    print("Counting from 1 up to 5: \(i)")
}

var lyric = "Haters gonna"
for _ in 1...5{
    lyric += " hate"
}
print(lyric)

var countdown = 10
while countdown > 0 {
    print("\(countdown)...")
    countdown -= 1
}

let id = Int.random(in:1...1000)
let amount = Double.random(in: 0...1)
var roll = 0
while roll != 20 {
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}
let filenames = ["me.jpg", "work.txt", "sophie.jpg"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue // go to the start of the loop
    }
    print("Found picture: \(filename)")
}


let number1 = 4
let number2 = 14
var multiples = [Int]()
for i in 1...100_100 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)
        if multiples.count == 10 {
            break
        }
    }
}

print(multiples)

for i in 1...100 {

    if i.isMultiple(of: 3) && i.isMultiple(of: 5){
        print("FizzBuzz")}
    else if i.isMultiple(of: 3) {
        print("Fizz")}
    else if i.isMultiple(of: 5) {
            print("Buzz") }
    else{
        print("\(i)")}
}
