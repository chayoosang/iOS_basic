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

// reference type (class, function, closure) -> 참조
// value type (Int, String, Array, Dictionary, struct) -> 값을 사용


var str: String? = "a"
var str2 = str
var str3 = str2

class SomeA{
    
}

class SomeClass {
    var b = 10

    
    func someFunc() {
        print(b)
        self.b
        b
    }
    
    // lazy -> 내가 해당 부분에 접근할 때 만들어진다.
    // self == java의 this
    // self를 사용하는 순간 class 자신 자체를 참조한다는 의미
    // 외부에 있는것을 접근 하는 것을 Capturing
    // Closure가 Capturing 하고 있을 때는 class가 해제가 안된다. -> Closure도 nil로 해제해야 한다.
    lazy var myClosure: (() -> Void)? = {
        print(self.b)
    }
    
    // capture list -> 매번 nil을 주기 번거로울 때 사용
    // 참조 하는것이 아닌 복사를 하여 사용
    // 만약 reference type을 사용해야 할 경우 weak를 통해 약한 참조를 사용한다.
    lazy var myClosure2 = { [weak self] in
        print(self?.b ?? 0)
    }
    
     // deinit -> 메모리에서 해제되었다
    deinit {
        print("SomeClass deinit")
    }
}

var myClass: SomeClass? = SomeClass()
var myClass2 = myClass

myClass?.b = 20
myClass2?.b

// 모든 참조를 끊어야 메모리에서 해제가 된다.

myClass?.myClosure = nil

myClass?.myClosure2

myClass = nil
myClass2 = nil


// Closure4

// escaping closure (탈출)
// escaping은 function이 끝나더라도 언제 실행될 지 모를 때 사용하는 키워드이다.


var myClosureList = [() -> Void] ()

func showString2(completion: @escaping () -> Void) {
    myClosureList.append(completion)
}

showString2 {
    print("aa")
}
showString2 {
    print("bb")
}

showString2 {
    print("cc")
}

myClosureList


myClosureList.forEach { completion in
    completion()
}

var names = ["lee", "kim", "jim", "min"]

names.sort { str1, str2 in
    return str1 < str2
}
names
