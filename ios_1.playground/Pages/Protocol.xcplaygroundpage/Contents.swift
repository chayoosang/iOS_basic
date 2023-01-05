import Foundation


// protocol -> java의 interface
// 규격, 규칙, 뼈대


protocol UserInfo {
    var userName: String {get set}
    var age: Int {get set}
    
    /// 나이를 화면에 출력할 때 사용
    func presentAge() -> String
}


class Member: UserInfo {
    var userName: String = ""
    var age: Int = 0
    func presentAge() -> String {
        age.description + " 살"
    }
    
}


class Guest: UserInfo {
    var userName: String = ""
    var age: Int = 0
    func presentAge() -> String {
        age.description + " 살"
    }
}


class User: UserInfo {
    var userName: String = ""
    var age: Int = 0
    
    var birthday = "10월 21일"
    
    func presentAge() -> String {
        "\(2022 - age) 년생"
    }
}

let member = Member()
let guest = Guest()
let user = User()

let users: [UserInfo] = [member, guest, user]
users.forEach { info in
    print(info.presentAge())
}

(users[2] as? User)?.birthday


protocol Togglabel {
    mutating func toggle()
}


enum OnOffSwitch: Togglabel {
    case on, off
    
    mutating func toggle() {
        if self == .on {
            self = .off
        }else {
            self = .on
        }
    }
}

var onOffSwitch = OnOffSwitch.off
onOffSwitch.toggle()


protocol SomeProtocol {
    init(age: Int)
}


class VIPMember: SomeProtocol {
    var age: Int
    
    required init(age: Int) {
        self.age = age
    }
}


var vip = VIPMember(age: 20)



// Delegation

enum AdultType {
    case adult
    case notAdult
}
// AnyObject -> Class에서만 사용하겠다는 규격
protocol UserInfoDelegate: AnyObject {
    func isAdult(adultType: AdultType)
}


class UserA: UserInfoDelegate {
    
    func isAdult(adultType: AdultType) {
        print(adultType)
    }
    
    deinit{
        print("deinit UserA")
    }
}


class TypeChecker {
    weak var delegate: UserInfoDelegate?
    
    func checkDone() {
        delegate?.isAdult(adultType: .adult)
    }
}


var userA: UserA? = UserA()
let typeChecker = TypeChecker()

typeChecker.delegate = userA

typeChecker.checkDone()


userA = nil


// protocol extension

protocol RandomGenerator {
    func randomNumber() -> Int
}

// 상속과 비슷한 개념
extension RandomGenerator {
    func randomNumber() -> Int {
        Int.random(in: 1...10)
    }
}

struct UserData: RandomGenerator {
    func randomNumber() -> Int {
        Int.random(in: 20...30)
    }
}

var userData = UserData()
userData.randomNumber()


// protocol composition

protocol Named {
    var name: String {get}
}

protocol Aged {
    var age: Int {get set}
}


struct PersonData: Named, Aged{
    var name: String {
        return "cys"
    }
    var age: Int {
        get{
            return tempAge
        }
        set {
            tempAge = newValue
        }
    }
    
    var tempAge: Int = 0
}

func showPersonData(person: Named & Aged) {
    print(person.name, person.age)
}

var personData = PersonData()


showPersonData(person: personData)


