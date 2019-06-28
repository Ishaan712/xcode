import UIKit

var str = "Hello"

var newString = str + " Ishaan"

for characters in newString{
    print(characters)
}

var newTypeString = NSString(string: newString)

newTypeString.substring(to: 5)
newTypeString.substring(from: 6)
newTypeString.substring(with: NSRange(location: 3, length: 5))
newTypeString.contains("Ish")
newTypeString.components(separatedBy: " ")
newTypeString.uppercased
newTypeString.lowercased




