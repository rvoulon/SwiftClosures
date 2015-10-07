//: Closure Expressions
// We'll have a look at anonymous functions vs named closures (assigning functions to variables)

func doubler(i: Int) -> Int {
    return i * 2
}

let doubleFunction = doubler
doubleFunction(4)

let numbers = [1,2,3,4,5]

let doubleNumbers = numbers.map(doubleFunction)
// How is this a closure? Well, doubleFunction is nested in Map function, who's variables are captured by doubleFunction.

print(doubleNumbers)

// Using closure expressions with the map function
let tripledNumbers = numbers.map( { (i: Int) -> Int in return i * 3 })

print(tripledNumbers)

// Using closure expressions with the sorted function
var names = ["Chrissie", "Qudsia", "Jobetja", "Nina", "Anoek"]

func backwards(s1: String, s2: String) -> Bool {
    return s1 > s2
}

print(names.sort(backwards))

let sortedNames = names.sort() {
    (s1: String, s2: String) -> Bool in
    return s1 > s2
}
sortedNames

// Closure shorthand syntax
//////////////////////////////

/* Rule #1:
If you just want to pass your closure in as an argument then you don't
need to assign it to a local variable or constant; you can pass it in directly.
*/
let tripleFunction = { (i: Int) -> Int in return i * 3 }
[1,2,3,4,5].map(tripleFunction)
// becomes:
[1,2,3,4,5].map({ (i: Int) -> Int in return i * 3 })

/* Rule #2:
When a closure is passed as an argument to a function, Swift can infer the types
of the parameters, and the type of the value that it returns, from the context.
*/
[1,2,3,4,5].map({ (i: Int) -> Int in return i * 3 })
// becomes:
[1,2,3,4,5].map({ i in return i * 3 })

/* Rule #3:
If we have a single expression closure, then the return value is explicit.
*/
[1,2,3,4,5].map({ i in return i * 3 })
// becomes:
[1,2,3,4,5].map({ i in i * 3 })


/* Rule #4:
Swift automatically assigns argument names to inline closures, which can be used
to refer to values of the inline closure's arguments as certain names.
*/
[1,2,3,4,5].map({ i in i * 3 })
// becomes:
[1,2,3,4,5].map({ $0 * 3 })


/* Rule #5:
If the closure expression is the last argument to an expression, you can move
the expression outside the () of the function call and write it as a trailing
closure instead. This is especially useful if the closure is too long to be
written on a single line.
*/
[1,2,3,4,5].map({ $0 * 3 })
// becomes:
[1,2,3,4,5].map() { $0 * 3 }

// Another example:
[1,2,3,4,5].map() {
    (var digit) -> Int in
    if digit % 2 == 0 {
        return digit/2
    } else {
        return digit
    }
}

/* Rule #6:
If a closure expression is the only argument to the function, then you can
remove the function's parentheses altogether.
*/
[1,2,3,4,5].map() { $0 * 3 }
// becomes:
[1,2,3,4,5].map { $0 * 3 }




