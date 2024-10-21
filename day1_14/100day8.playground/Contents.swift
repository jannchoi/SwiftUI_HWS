import Cocoa


func printTimesTables(for number: Int, end: Int = 12){
    for i in 1...end{
        print("\(i) X \(number) is \( i * number)")
    }
}
printTimesTables(for: 5)

var characters = ["Lana", " pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll(keepingCapacity: true)
//keep the array's existing capacity
print(characters.count)




enum PasswordError: Error {
    case short, obvious
}

func checkPasswarod(_ password: String) throws -> String {
    if password.count < 5 {throw PasswordError.short}
    if password == "12345" {throw PasswordError.obvious}
    
    if password.count < 8 {
        return "OK"}
    else if password.count < 10 {
        return "Good"}
    else {
        return "Excellent"
    }
}

let string = "12345"
do {// when using try, we need to be inside a do blockk
    let result = try checkPasswarod(string)
    print("Password rating: \(result)" ) }
catch PasswordError.short {// catch the throw
    print("Please use a longer password.")}
catch PasswordError.obvious{
    print("I have the same combination on my luggage!")}
catch {
    print("There was an error.")
}

do {
    let result = try checkPasswarod(string)
    print("Password rating: \(result)" ) }
catch {
    print("There was an error: \(error.localizedDescription)")
}

enum bounds : Error {
    case OutOfBounds, noroot
}
func squares(of input: Int) throws -> Int{
    if input > 10000 || input < 1 {throw bounds.OutOfBounds}
    for i in 1...100{
        if i*i == input{
            return i
        }
    }
    throw bounds.noroot
}

do{
    let result = try squares(of: 25)
    print("Square root is \(result).")
} catch bounds.OutOfBounds{
    print("Input is out of Bounds.")
} catch bounds.noroot{
    print("No integer square root found.")
}catch {
    print("An unexpectd error occured")
}
