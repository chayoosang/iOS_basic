import Foundation

// class && struct

// init

// oz -> ml
// ml -> oz

// 1 oz -> 29.5 ml
// 1 ml -> 0.033 oz

// Customizing Initialization
struct UnitConversion{
    var oz: Double = 0
    var ml: Double = 0
    
    init() {
        
    }

    init(oz: Double){
        self.oz = oz
        self.ml = oz * 29.5
    }
    
    init(ml: Double) {
        self.ml = ml
        self.oz = ml / 29.5
    }
}

var unitConversion = UnitConversion(ml: 1)
unitConversion.ml
unitConversion.oz

var unitConversion2 = UnitConversion(oz: 1)
unitConversion2.ml
unitConversion2.oz


var unitConversion3 = UnitConversion()
unitConversion3.ml
unitConversion3.oz



// Convenience initializer
// 조건 - 다른 init을 반드시 실행
// class에서만 가능
class Profile {
    var name: String
    var age: Int
    var isAdult: Bool
    
    // Designated Initializers -> 일반적 init
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        self.isAdult = age > 19 ? true : false
    }
    
//    init(age: Int){
//        self.name = ""
//        self.age = age
//        self.isAdult = age > 19 ? true : false
//    }
    
    convenience init(age: Int) {
        self.init(name: "", age: age)
    }
    
    func showName() {
        print(name)
    }
}


// 상속
class MemberProfile: Profile {
    var sex: Bool
    
    init (name: String, age: Int, sex: Bool) {
        self.sex = sex
        super.init(name: name, age: age)
    }
    
    convenience override init(name: String, age: Int) {
        self.init(name: name, age: age, sex: true)
    }
    
    override func showName() {
        print(name + " 님 안녕하세요.")
        print(self.sex)
    }
}

var member = MemberProfile(name: "차유상", age: 25)
member.showName()


// Required Initialization
// 상속에만 해당

class BaseView {
    // CGRect -> x, y, width, height -> 코드로 만드는 UI
    init(frame: CGRect) {
        
    }
    
    // NSCoder -> 인터페이스로 만드는 UI
    required init(coder: NSCoder) {
        
    }
}

class RedView: BaseView {
    init() {
        let frame = CGRect(origin: CGPoint(x: 50, y: 50), size: CGSize(width: 200, height: 200))
        super.init(frame: frame)
    }
    
    override init(frame: CGRect) {
        let frame = CGRect(origin: CGPoint(x: 50, y: 50), size: CGSize(width: 200, height: 200))
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
}


// Failable Initializer
// init?

class MyClss {
    init?(type: String) {
        if type == "" {
            return nil
        }
        print("Success", type)
    }
}

let myClsss = MyClss(type: "")


// Deinitialization (초기화 해제)
// deinit
// class 전용 기능

class Test {
    init() {
        print("init")
    }
    
    deinit {
        // 여기는 이 클래스가 메모리에서 해제 됐을 떄
        print("deinit")
        // 해제시 필요한 로직
    }
}

var test1: Test? = Test()
var test2 = test1

test1 = nil
test2 = Test()

class Bank {
    static var coin: Int = 500
}

class Player {
    var coin: Int
    init(coin: Int) {
        self.coin = coin
    }
    
    func plus() {
        self.coin += 100
    }
    
    deinit{
        Bank.coin += self.coin
    }
}

var player1: Player? = Player(coin: 100)
var player2: Player? = Player(coin: 100)


player1?.plus()
player1?.plus()

player2?.plus()

Bank.coin
    
player1 = nil

Bank.coin

player2 = nil

Bank.coin
