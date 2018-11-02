//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation


func mathStuffFactory(opString: String) -> (Double, Double) -> Double {
    switch opString {
    case "+":
        return {x, y in x + y }
    case "-":
        return {x, y in x - y }
    case "*":
        return {x, y in x * y }
    case "/":
        return {x, y in x / y }
    default:
        return {x, y in x + y }
    }
}

func myFilter (inputArray1: [Double], closure: (Double) -> Bool) -> [Double] {
    var emptyArray = [Double]()
    for number in inputArray1 {
        if closure(number) {
            emptyArray.append(number)
        }
    }
    return emptyArray
}
func myReduce(inputArray2: [Double], orderByThis: Double, reduceClosure: (Double, Double) -> Double) -> Double{
    var reduceOpration = orderByThis
    for num in inputArray2{
        reduceOpration = reduceClosure(reduceOpration, num)
    }
    return reduceOpration
}
func myMap(inputArray3: [Double], mapClosure: (Double) -> Double) -> [Double]{
    var emptyArray = [Double]()
    for num in inputArray3{
        emptyArray.append(mapClosure(num))
    }
    return emptyArray
}


let calculatorGame = true
loop1: while calculatorGame == true {
    print("Welcome to Calculator World! Please enter the levels of calculator, 1 (e.g 2 + 1), 2 (e.g 2 ? 1), or 3 (high oder)😜")
    
    
    let input = readLine()
    
    switch input {
    case "1":
        print("Ready Go😝! Enter your operation, e.g 2 + 1")
        
        let userInput = readLine()! //让input的数字 设成 userInput = readline（）
        var numArray = userInput.components(separatedBy: " ")// 让num 变成array 所以可以根据array 的index【0】【1】【2】来选填写我们接下来的方程式。l
        //print(numArray) // 利用component（separateby：“”）是因为 当component出现 它会帮助我们把code 分开，如果需要 空格间隔 “ ”，如果需要 ， 间隔 “，”
        
        let num1 = Double(numArray[0]) ?? 0.0 // 类似if statement，设num1 = double（因为我们需要return double） numarray【0】（是userinput的第一个数字的index） ？？（是如果。。没发生，就等于。。 （如果没有userinput 那么 利用？？， ？？后面所输入的 就是如果前者没发生 ，转换成后者））
        let num2 = Double(numArray[2]) ?? 0.0// 这里是numarry【2】 是因为【2】是第二个userinput需要输入的数字 numarray【1】是 +-/*
        // let operation = numArray[1] ?? ""
        
        let answer = mathStuffFactory(opString: numArray[1]) // 这里的方程式 是为了让 +-/* 可以随机 所以利用 numarray【1】
        print("\(num1) \(numArray[1]) \(num2) = \(answer(num1,num2))") //这就会形成我们需要的方程式 如： 4。0 / 2.0 = 2.0
        
    case "2" :
        print("Let's GO! Have Fun!Enter your operation, e.g 2 ? 1 🤪")
        
        let questionMark = readLine() ?? "not valid"
        
        var numArray1 = questionMark.components(separatedBy: " ")
        
        let optionalOpString = ["+","-","/","*"]
        
        
        if questionMark.contains("?") {
            
            let num3 = Double(numArray1[0]) ?? 0.0
            let num4 = Double(numArray1[2]) ?? 0.0
            let optionalOpString = ["+","-","/","*"]
            var randomSign = optionalOpString.randomElement() ?? "not valid"
            
            let answer1 = mathStuffFactory(opString: randomSign)
            // 这里的方程式 是为了让 +-/* 可以随机 所以利用 numarray【1】
            let result = answer1(num3,num4)
            print("\(num3) \(optionalOpString) \(num4) = \(answer1(num3,num4))") //这就会形成我们需要的方程式 如： 4。0 / 2.0 = 2.0
        }
        
    case "3" :
        print("Go Go Go!!!😜 Let's enter your operation, e.g filter 1,5,2,7,3,4 by < 4")
        let userInput1 = readLine() ?? "not valid"
        var numArray2 = userInput1.components(separatedBy: " ")
        if numArray2.count == 5 {
            let nameOfFunc = numArray2[0]
            let numOfUserInput = numArray2[1].components(separatedBy: ",").compactMap{Double($0)}
            let opSign = numArray2[3]
            let nameOfBy = Double(numArray2[4]) ?? 0
            switch nameOfFunc{
            case "filter":
                if opSign == ">" {
                    //                print(myFilter(inputArray: numOfUserInput,filter: {$0 > nameOfBy ? true : false}),}
                    print(myFilter(inputArray1: numOfUserInput, closure:{ $0 > nameOfBy ? true : false}))
                }
                else {
                    if opSign == "<" {
                        print(myFilter(inputArray1: numOfUserInput, closure:{ $0 < nameOfBy ? true : false}))
                    }
                }
            case "map":
                if opSign == "*" {
                    print(myMap(inputArray3: numOfUserInput){nameOfBy * $0})
                } else if opSign == "/"{
                    print(myMap(inputArray3: numOfUserInput){nameOfBy / $0})
                }
            case "reduce":
                if opSign == "+"{
                    print(myReduce(inputArray2: numOfUserInput, orderByThis: nameOfBy){$0 + $1})
                } else if opSign == "*" {
                    print(myReduce(inputArray2: numOfUserInput, orderByThis: nameOfBy){$0 * $1})
                } else {
                    print("Well... Incorrect, let's do again!")
                }
            default :
                print("Error...😟")
            }
        } else {
            print("This is the correct way to do e.g filter 1,5,2,7,3,4 by < 4, so Let's strat again!!🧐")
        }
        
    default:
        print("Opp..CRUSH!!! PLEASE RESTART THE GAME!🙄")
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}
