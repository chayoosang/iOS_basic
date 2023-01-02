import Foundation


// property

// 변수
var name = ""

// stored property (저장된 프로퍼티)
class MyClass {
    // property
    var name = ""
}

struct MyStruct {
    // property
    var name = ""
}

let myClass = MyClass()
myClass.name = "kim"
myClass.name

var myStruct = MyStruct()
myStruct.name = "kim"
myStruct.name


// lazy stored property
class MyClass2 {
    var age = 20
    lazy var names = ["kin", "lee"] // 10000000개 있다고 가정
    // lazy는 class 참조 때 안만들어지고 names에 접근할 때 생성됨
    
    lazy var nameCount = names.count
    
    func nameCount2() -> Int {
        return names.count
    }
}

// 큰 데이터로 인한 오버 라이딩 -> 생성하는 순간 사용성이 떨어짐
var myClass2 = MyClass2()
myClass2.names
myClass2.nameCount
myClass2.nameCount2()



// computed property
class MyProfile {
    var age = 20
    
    // computed property (read only, get-only) -> function 처럼 작동
    var isAdult1: Bool {
        age > 19 ? true : false
    }
    
    var isAdult2: Bool {
        get {
            !tempIsAdult
        }
        set {
            tempIsAdult = newValue
        }
    }
    
    var tempIsAdult = false
}


var profile = MyProfile()

profile.isAdult2
profile.isAdult2 = true
profile.isAdult2


// property observer
// 프로퍼티에 값을 새로 설정(set)할 떄 감지해서 알려주는 개념

class StepCounter {
    var steps = 0 {
        willSet{
            print("현재 값", steps)
            print("설정하려는 값", newValue)
        }
        didSet{
            print("이전 값", oldValue)
            print("현재 값", steps)
        }
    }
}


let setpCounter = StepCounter()
setpCounter.steps = 10



// Property Wrappers -> 공용으로 사용

// 프로퍼티에 기능을 넣는다.

// 글자 입력 제한 - 10

// 단 상황이 다른 경우 -> init으로 만들면 된다


@propertyWrapper
class CharacterLimit {
    
    var tempText = ""
    
    var limitCount = 0
    //propertyWrapper로 공용으로 사용할려면 wrappedValue로 꼭 적어야한다
    var wrappedValue: String {
        get {
            return tempText
        }
        set {
            var myText = newValue
            while myText.count > limitCount {
                myText.removeLast()
            }
            tempText = myText
        }
    }
    
    init(wrappedValue: String, limitCount: Int) {
        self.wrappedValue = wrappedValue
        self.limitCount = limitCount
    }
}

class Display {
    
    @CharacterLimit(limitCount: 10)
    var name: String = ""
    
    @CharacterLimit(limitCount: 5)
    var password: String = ""
    
}

let display = Display()

display.name = "0123456789003123"
display.password = "abcdefghijklmnop"


display.name
display.password
