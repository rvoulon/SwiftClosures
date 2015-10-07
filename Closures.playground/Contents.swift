//: Closures (updated for Swift 2.0)

import Foundation

func sayHello() {
    print("Hello from the function")
}

sayHello() // Hello from the function

// Let's create a variable of type function, of the same type as sayHello:

var sayHelloClosure: () -> () = {
    print("Hello from the closure")
}

// We're now calling this variable

sayHelloClosure() // Hello from the closure

// Since the function sayHello() is of the same type as our
// closure, we can assign the function to the closure variable.
// Remove the () from the function though.

sayHelloClosure = sayHello

sayHelloClosure() // Hello from the function

func introToFriends(friendOne:String, friendTwo:String) -> String {
    return "\(friendOne) I'd like you to meet my other friend \(friendTwo)"
}

var intro = introToFriends("Nina", friendTwo: "Yukio") // returns Nina I'd like you to meet my other friend Yukio
print(intro)

//{
//    () -> returntype in
//    statements
//}

var combine: (String, String) -> String

//combine = {
//    a, b -> String in
//    return a + b
//}

//combine = {
//    a, b -> String in a + b
//}

// now using shorthand arguments with type inference
////////////////////////////////

//combine = { $0 + $1 } // Whoa, right?

//combine("Hello ", "Jobetja")

let hasPrefixAndSuffix: (String, String, String) -> Bool = {
    var hasPrefix = $0.hasPrefix($1)
    var hasSuffix = $0.hasSuffix($2)
    return hasPrefix && hasSuffix
}
// hasPrefix() and hasSuffix() are from the standard Swift library

hasPrefixAndSuffix("Jim - Bob", "Jim", "Bob")


// passing an inline closure
/////////////////////////////

// let's sort a bunch of numbers using a function
let aBunchOfInts = [1,2,3,4,5,6,7,8,9,10]

func reverseSorter(numberOne: Int, numberTwo: Int) -> Bool {
    if numberOne < numberTwo {
        return false
    }
    return true
}

aBunchOfInts.sort(reverseSorter)

// now rewrite that function we pass as a closure, and pass it in
let forwardSorter: (Int, Int) -> Bool = {
    (numberOne: Int, numberTwo: Int) -> Bool in
    if numberOne < numberTwo {
        return true
    }
    return false
}

aBunchOfInts.sort(forwardSorter)

// Now we'll rewrite all that using shorthand arguments
let reverseSortClosure: (Int, Int) -> Bool = { $0 > $1 }
aBunchOfInts.sort(reverseSortClosure)

// and now inline:
aBunchOfInts.sort({ $0 > $1 })
print(aBunchOfInts.sort({ $0 > $1 }) )

// now what's pretty funky is that > itself is a function of type (Int, Int) -> Bool, so:
print(aBunchOfInts.sort( > ))
// now go ahead and freak out :)


// Trailing closures
//////////////////////

let arrayOfInts = [0,1,2,3,4,5,6,7,8,9]

let digitNames = [
    0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four", 5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]

// Here we are passing the closure outside of the (), which is why it's called a trailing closure. You can do that if the closure is the LAST or ONLY argument. We can even remove the () from map() at this point...

let stringArray = arrayOfInts.map() {
    (number: Int) -> String in
    var returnString: String = digitNames[number]!
//    let length = count(returnString)
    let length = returnString.characters.count
    
    if length < digitNames.count {
        returnString = digitNames[length]!
    }
    
    return returnString
}

stringArray




func printString(aString: String) {
    print("Printing the string passed in: \(aString)")
}

printString("Here's a string for ya!")
// Result:
// Printing the string passed in: Here's a string for ya!

// Assign the function we just declared to a constant.
// Note that we do not add () to the function name.

let someFunction = printString

someFunction("Hey, here I am!")
// Result:
// Printing the string passed in: Hey, here I am!

func displayString(printStringFunc: (String) -> Void)  {
    printStringFunc("I'm a function inside another function")
}

displayString(printString)

// Result:
// Printing the string passed in: I'm a function inside another function

func printInt(number: Int) {
    print("Printing the number passed in: \(number)")
}

let numberOfApples = 3

printInt(numberOfApples)


// Using the filter function

let allNumbers = [1,2,3,4,5,6,7,8,9,10]

func isEvenNumber(i: Int) -> Bool {
    return i % 2 == 0
}

let ifEven = isEvenNumber

let evenNumbers = allNumbers.filter(ifEven)
print("Printing evenNumbers: \(evenNumbers)")

// ...which gives exactly the same result as passing the function directly:

let moreEvenNumbers = allNumbers.filter(isEvenNumber)
print("Printing moreEvenNumbers: \(moreEvenNumbers)")

// From the forums, someone posted this:
// I found the logic really hard to follow with the above example.
// To sum it up, we can pass functions as parameters.
// It might make more sense when using numbers.
func addOneToNumber (number: Int) -> Int {
    return number + 1
}


// This is a function, that takes another function,
// a function of type "(Int) -> Int"
// that is passed in as a parameter
// and returns an Int.


func addTwoToYourOtherFunction (takeAFunctionAndAddTwo: (Int) -> Int) -> Int {
    
    return takeAFunctionAndAddTwo(2)
    // takes the function you passed in and passes 2 as a parameter to it.
}

// Now take the above function and pass another function of the specified type
//" (Int) -> Int " as a  parameter.

addTwoToYourOtherFunction(addOneToNumber)   // 3


//////////////////////////////////
// Capturing Variables
//////////////////////////////////

// Returning functions

func printerFunction() -> (Int) -> () {
    var runningTotal = 0
    func printInteger(number: Int) {
        runningTotal += 10
        print("The running total is: \(runningTotal)")
    }
    return printInteger
}

// THIS (printAndReturnIntegerFunc) is a closure:
// A combination of a function and an environment of captured variables.
// A closure captures variables from its surrounding context.
// The printerFunction itself is NOT the closure.
// Nested functions are the simplest form of a closure.
let printAndReturnIntegerFunc = printerFunction()

printAndReturnIntegerFunc(2) // The running total is 10
printAndReturnIntegerFunc(3) // The running total is 20 (mind blown...)
// The constant still has a reference to its variables.

// runningTotalFunction is another closure
let runningTotalFunction = printerFunction()
runningTotalFunction(4) // The running total is 10 (now the value has reset)

// You can also make a closure by writing a closure expression, up next!!!







