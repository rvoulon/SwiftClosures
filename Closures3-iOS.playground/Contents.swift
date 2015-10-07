//: iOS Closures

import UIKit

// Example 1: UIView animation closures
/////////////////////////////////////////////

let someLabel = UILabel()

UIView.animateWithDuration(1.0, animations: { () -> Void in
    // Carry out animation sequence
    someLabel.alpha = 0.3
    }) { (failure:Bool) -> Void in
    // When animation completes, execute this closure
}

// Example 2: Making a network request
/////////////////////////////////////////////

// First, create session, URL and request variables (well constants, really)
let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
let url = NSURL(string: "http://blog.teamtreehouse.com/api/get_recent_summary/?count=20")
let request = NSURLRequest(URL: url!)

// Then, create the download task.
let downloadTask = session.downloadTaskWithRequest(request) {
    (let url, let response, let error) in
    // Execute the body of the closure
}

// Then resume (or start) the task
downloadTask.resume()

// Using a type alias

typealias JSONDictionaryCompletion = ([String:AnyObject]?) -> ()

func downloadJSONFromURL(completion: JSONDictionaryCompletion) {
    
}

func getRecentBlogPosts(completion: (NSURLResponse! -> Void)) {
    let treehouseDownloadTask = session.downloadTaskWithRequest(request) {
        (let url, let response, let error) in
        completion(response)
    }
}

getRecentBlogPosts {
    (let response) in
    // Start body of method
}

/*
Closures recap
----------------

- A function is a first class citizen in Swift. This means you can use it much like an Integer or a String.
- A function can be assigned to a constant or a variable and passed around.
- A function can be used as a parameter to another function.
- A function can be set as the return type of another function.
- Functions can capture variables that exist outside of their scope. A combination of a function and an environment of captured variables is known as a closure.

There are two primary ways of creating closures:
1. Using the func keyword and assigning the function to a constant or variable to create a closure.
2. Using a set of curly braces to create an anonymous function. Swift calls these closure expressions.
    a) To write a closure expression we start with curly braces, followed by the parameters of the closure enclosed in (), then the return type and finally we start the body of the closure with the keyword in.
    b) Finally, the typealias keyword lets us create alternative names for our closure signatures so that we can give them more descriptive names, thereby making our code more readable.

*/










