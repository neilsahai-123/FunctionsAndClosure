import UIKit

var greeting = "Hello, playground"


//Functions: Functions are self-contained chunks of code that perform a specific task. You give a function a name that identifies what it does, and this name is used to “call” the function to perform its task when needed.

func greetGoodMorning() {
    print("Hello, World, Good Morning..!")
}

func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

func calculateSumOfNumbers(num1: Int, num2: Int) -> Int {
    return num1 + num2
}

func calculateAverageOfNumbers(numbers: [Int]) -> Double {
    let sum = numbers.reduce(0) { partialResult, num in
        return partialResult + num
    }
    let  average = sum / numbers.count
    return Double(average)
}



greetGoodMorning()
print(greet(person: "John"))

let sumOfNums = calculateSumOfNumbers(num1: 10, num2: 20)
print("sum of numbers is \(sumOfNums)")

let averageOfNums = calculateAverageOfNumbers(numbers: [10, 20, 30, 40])
print("Average of numbers is \(averageOfNums)")


//Functions with Multiple Return Values

func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")



/*
Closures: Group code that executes together, without creating a named function.
Closures are self-contained blocks of functionality that can be passed around and used in your code. Closures in Swift are similar to blocks in C and Objective-C and to lambdas in other programming languages.

Syntax of Closure
 { (<#parameters#>) -> <#return type#> in
    <#statements#>
 }
*/



func startTimer(completion: @escaping(String) -> Void) -> String {
    
    var count = 0
    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
        count += 1
        if count == 20 {
            completion("Completed with count \(count)")
            timer.invalidate()
        }
        print(count)
     }
    
    return "Timer Started"
}

print(startTimer(completion: { completed in
    print(completed)
}))


func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
print("Increamented by 10: \(incrementByTen())")
