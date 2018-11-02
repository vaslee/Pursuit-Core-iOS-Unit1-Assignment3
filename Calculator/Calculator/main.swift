//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

let calculatorGame = true

loop1: while calculatorGame == true {

    
    func begining() {
        print("Welcome to Calculator World! Please enter the levels of calculator, 1 (regular), 2 (calcular game), or 3 (high oder)😜")


        let input = readLine() ?? "not valid"

        switch input {
            case "1":
            print("Ready Go😝! Enter your operation, e.g 2 + 1")
            case "2" :
            print("Let's GO! Have Fun!Enter your operation, e.g 2 ? 1 🤪")
            case "3" :
                print("Go Go Go!!!😜 Let's enter your operation, e.g filter 1,5,2,7,3,4 by < 4")
            default:
                print("Opp..CRUSH!!! PLEASE RESTART THE GAME!🙄")
                    sleep(1)
                    begining()
            }
    }
        begining()
    
    func second() {
        print("Wants continue? Enter yes or no 🤩")
        let input2 = readLine()!
        
            switch input2.lowercased() {
                case "yes":
                    print("Let's keep Going!😘 Please enter the levels of calculator, 1 (regular) or 2 (high oder)😜")
                case "no" :
                    print("Thank you for using our product! Bye-bye👋🏼")
                default:
                        print("Emmm... What else do you want?🙄")
                sleep(1)
                second()
        }
    }
    
    func simpleOp() {
    
        let userInput = readLine()! //让input的数字 设成 userInput = readline（）
        var numArray = userInput.components(separatedBy: " ")// 让num 变成array 所以可以根据array 的index【0】【1】【2】来选填写我们接下来的方程式。l
        //print(numArray) // 利用component（separateby：“”）是因为 当component出现 它会帮助我们把code 分开，如果需要 空格间隔 “ ”，如果需要 ， 间隔 “，”

        let num1 = Double(numArray[0]) ?? 0.0 // 类似if statement，设num1 = double（因为我们需要return double） numarray【0】（是userinput的第一个数字的index） ？？（是如果。。没发生，就等于。。 （如果没有userinput 那么 利用？？， ？？后面所输入的 就是如果前者没发生 ，转换成后者））
        let num2 = Double(numArray[2]) ?? 0.0// 这里是numarry【2】 是因为【2】是第二个userinput需要输入的数字 numarray【1】是 +-/*
        // let operation = numArray[1] ?? ""
        
        let optionalOpString = ["+","-","/","*"]
        var randomSign = optionalOpString.randomElement() ?? "not valid"
        print(randomSign)
        
        
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

    let answer = mathStuffFactory(opString: numArray[1]) // 这里的方程式 是为了让 +-/* 可以随机 所以利用 numarray【1】
    print("\(num1) \(numArray[1]) \(num2) = \(answer(num1,num2))") //这就会形成我们需要的方程式 如： 4。0 / 2.0 = 2.0

    func questionMark() {
        if let input6 = readLine() {
            
            var numArray1 = input6.components(separatedBy: " ")
            
            let optionalOpString = ["+","-","/","*"]
            //            var randomSign = optionalOpString.randomElement() ?? "not valid"
            //            print(randomSign)
            
            if input6.contains("?") {
                let num3 = Double(numArray1[0]) ?? 0.0
                let num4 = Double(numArray1[2]) ?? 0.0
                let optionalOpString = ["+","-","/","*"]
                var randomSign = optionalOpString.randomElement() ?? "not valid"
                
                let answer = mathStuffFactory(opString: randomSign) // 这里的方程式 是为了让 +-/* 可以随机 所以利用 numarray【1】
                
                print("\(num3) \(randomSign) \(num4) = \(answer(num3,num4))") //这就会形成我们需要的方程式 如： 4。0 / 2.0 = 2.0
                
            }
        }

}
}
}

    
    
    
    
    
    
    
    
//let num1 = readLine()!
//let op = readLine()!
//let num2 = readLine()!
////var sign = num1.filter(){"+/-*".contains($0)}
////print(sign)
//
//let components = num1.components(separatedBy: " ")
//
//let operation = mathStuffFactory(opString: op)
//
//let result = operation(Double(num1)!,Double(num2)!)
//print(result)





