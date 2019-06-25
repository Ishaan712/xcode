import UIKit

//strings and integers
var str = "Hello, playground"

str = "Goodbye"

var name:String = "Johnny"
name = "Appleseed"

var unkownString:String
unkownString = "3"

var int = 16
int*3

var a:Int = 5
a = a*3

var c = 5/2
var d:Double = 5/2
d*Double(c)

var longSentence = str + " " + name
var newString  = "I am \(int) years old"


//arrays and dictionaries
var arr = [1, 2, 3, 4, 5]

arr[3]
arr.append(6)
print(arr)
arr.remove(at: 2)
print(arr)
arr.removeLast()
print(arr)
arr.removeSubrange(1...2)
print(arr)

var newArr = [1, 2.5, "Bob"] as [Any]
var emptyArr:[Int]



var dict = ["name":"Ishaan", "age":16, "gender":"male"] as [String : Any]
print(dict["name"]!)

dict["eyecolor"] = "brown"
print(dict)
dict["age"] = nil
print(dict)

var newName = "name"
var sentence = "My name is \(String(describing: dict[newName]!))"


//If Statements
var myName = "Tom"
var time = 15

if myName == "Turner" && time < 12 {
    print("Good morning Turner")
} else if myName == "Turner" && time > 12 {
    print("Good afternoon Turner")
}else {
    print("Who are you?")
}

if myName == "Turner" || time < 20 {
    print("One statement is true")
}

var remainder  = 9%2


//Random Number
var randomNumber = arc4random_uniform(6) //between 0 and 5


















