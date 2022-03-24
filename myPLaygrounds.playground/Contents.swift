//: Playground - noun: a place where people can play

import UIKit

var str = "Hello"

var newString = str + " Ishaan"

for character in newString.characters {
    
    print(character)
}

var newTypeString = NSString(string: newString)

newTypeString.substringToIndex(5)

newTypeString.substringToIndex(12)

newTypeString.substringWithRange(NSRange(location: 3, length:5))

if newTypeString.containsString("Ishaan") {
    
    // Ishaan is there!
    
}

newTypeString.componentsSeparatedByString(" ")

newTypeString.uppercaseString

newTypeString.lowercaseString
