import UIKit

//strings and integers
var str = "Hello, playground"

str = "Goodbye"

var name:String = "John"
name = "Doe"

var fullName:String
fullName = "John " + name

var unkownString:String
unkownString = "3"

var int = 16
int*3

var a:Int = 5
a = a*3

var f:Int
f = 5
f = f+3

var c = 5/2
var d:Double = 5/2
d*Double(c)

var remainder  = 9%2

var longSentence = str + " " + name
var newString  = "I am \(int) years old"


////arrays and dictionaries
//var arr = [1, 2, 3, 4, 5]
//
//arr[3]
//arr.append(6)
//print(arr)
//arr.remove(at: 2)
//print(arr)
//arr.removeLast()
//print(arr)
//arr.removeSubrange(1...2)
//print(arr)
//
//var newArr = [1, 2.5, "Bob"] as [Any]
//var emptyArr:[Int]
//
//
//
//var dict = ["name":"Ishaan", "age":16, "gender":"male"] as [String : Any]
//print(dict["name"]!)
//
//dict["eyecolor"] = "brown"
//print(dict)
//dict["age"] = nil
//print(dict)
//
//var newName = "name"
//var sentence = "My name is \(String(describing: dict[newName]!))"
//
//
////If Statements
//var myName = "John"
//var time = 15
//
//if myName == "Jim" && time < 12 {
//    print("Good morning Jim")
//} else if myName == "Jim" && time > 12 {
//    print("Good afternoon Jim")
//}else {
//    print("Who are you?")
//}
//
//if myName == "Jim" || time < 20 {
//    print("One statement is true")
//}
//
//
////Random Number if needed
//var randomNumber = arc4random_uniform(6) //between 0 and 5
//
//
//
//// For Loops
//for i in 1...10{
//    print(i)
//}
//
//for i in stride(from: 30, through: 8, by: -2){
//    print(i)
//}
//
//var someArr =  [6, 3, 8, 1]
//for item in someArr {
//    print(item)
//}
//for (index, x) in someArr.enumerated(){
//    print(index)
//}
//print(" ")
//for i in 0..<someArr.count{
//    someArr[i] += 1
//}
//print(someArr)
//
//
//
////While Loops
//var i = 1
//while i < 5 {
//    print(i)
//    i+=1
//}
//
//var j = 2
//while j < 20{
//    print(j)
//    j = j+2
//}
//
//var arrs = [6, 2, 9, 1]
//var index = 0
//while index < arrs.count{
//    print(arrs[index])
//    index += 1
//}
//
//
//
//// Sample Prime Numbers Program
//var number = 2
//var isPrime = true
//
//if number == 1{
//    isPrime = false
//}
//if number != 2 && number != 1 {
//    for i in 2..<number {
//        if number % i == 0 {
//            isPrime = false
//        }
//    }
//}
//print(isPrime)










