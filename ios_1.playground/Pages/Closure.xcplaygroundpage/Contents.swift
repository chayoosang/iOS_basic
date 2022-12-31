import Foundation

//Closure

//함수와 개념이 같음

// function (named closure)
func plus(a: Int, b: Int) -> Int{
    return a + b
}


//closure (unnamed closure)

// 변수나 상수에 closure를 대입
var myClosure = { (a: Int, b: Int) -> Int in
    return a + b
}


plus(a: 10, b: 20)
myClosure(10,20)


// Function의 parameter에 closure를 넣어서 사용하는 방식

