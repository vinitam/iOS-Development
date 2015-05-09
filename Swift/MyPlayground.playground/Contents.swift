//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
println(str)

func calculate(number1 : Int, number2 :Int) -> (sum : Int, multiple: Int, subtract :Int)
{
    var sum : Int = number1 + number2
    var multiple : Int = number1 * number2
    var subtract : Int = number1 - number2
    return(sum, multiple, subtract)
}

let (sum,multiple,subtract) = calculate(5,3)

var sampleString = "hsddshjbds"



var sampleFloat :Int? = sampleString.toInt()

sampleFloat

