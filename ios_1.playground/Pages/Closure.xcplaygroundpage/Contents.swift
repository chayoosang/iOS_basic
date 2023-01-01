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

func f1(){
    print("작업중...")
    print("작업중...")
    
    f2()
}

func f2(){
    print("작업완료처리")
}

f1()

func f10(myClosure : () -> Void) {
    print("작업중...")
    print("작업중...")
    
    myClosure()
}

func f20() {
    print("작업완료처리")
}

f10(myClosure: { () -> Void in f20() } )
f10(myClosure: { f20() } )
f10 {f20()}

f10 {print("내가 원하는 로직")}



// Closure2

// func + closure2
func myFunc2(closure1: () -> Void, closure2: () -> Void){
    print("func2")
    
    closure1()
    closure2()
}

myFunc2 {
    print("closure1")
} closure2: {
    print("closure2")
}


// func + closure3
func myFunc3(closure1: () -> Void, closure2: () -> Void, closure3: () -> Void){
    print("func3")
    
    closure1()
    closure2()
    closure3()
}

myFunc3 {
    print("c1")
} closure2: {
    print("c2")
} closure3: {
    print("c3")
}

func myFunc4(i: Int, closure: () -> Void){
    print(i)
    closure()
}

myFunc4(i: 50) {
    print("closure")
}


// closure + parmeter

func myFunc5(completion: (Int) -> Void) {
    print("func...")
    let total = 100
    completion(total)
}

myFunc5 { total in
    print(total.description + "점")
}

func showScore(a: Int) {
    print((a + 10).description + "점")
}

myFunc5(completion: showScore)


// closure + return

func myFunc6(completion : () -> Int) {
    print("myFunc6")
    let a = completion()
    print(a.description)
}

myFunc6 {
    return 10
}


func myFunc7(completion : (Int) -> Int) {
    print("myFunc7")
    let a = completion(10)
    print(a.description)
}

myFunc7 { num in
    return num + 10
}

// Closure 3

// Capturing Values
