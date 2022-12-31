import UIKit



// Type
// Type Annotations

var name1: String = "cha yoo sang"
var name2 = "cha yoo sang"

var score1: Int = 100
var score2: Double = 100.00


// String Type
var greeting = "hello"

//""" 는 구조 그대로 값을 가지게 된다
greeting =
"""
hi
hello
welcome
"""
greeting = "hello"

greeting.uppercased()
greeting.lowercased()
greeting.capitalized

greeting.dropFirst()
greeting.dropLast()
greeting.dropLast().dropLast()

//이 글자는 해당 글자로 시작하는지 ?
greeting.hasPrefix("he")

//이 글자는 해당 글자로 끝나는지 ?
greeting.hasSuffix("llo")

//해당 글자가 들어잇는지 ?
greeting.contains("he")



//Bool

var bool = false

bool = 5>4

//반전 시키기
bool.toggle()

if bool == true{
   print("true")
}else{
    print("false")
}


//Numeric Types


var myScore = 50

var myNumber = 50.0



//Optional
//Optional은 래핑되어있는 것
var i:Int? = nil

//사용할 때는 언래핑을 해줘어야한다
var sum = (i ?? 10) + 10


i = 10




if let j = i{
    j
} else{
    print("i는 nil 입니다.")
}


