import Foundation


// Enumerations (열거형)
// enum

// 생성

enum GenderType: String {
    case man = "남자"
    case woman = "여자"
    case type1
    case type2
}

var genderType = GenderType.man
var genderType2: GenderType? = nil

func showGender (type: GenderType) {
    print("성별 : " + type.rawValue)
}

showGender(type: .woman)

func showGender2(type: GenderType) {
    switch type {
    case .man:
        print("남")
    case .woman:
        print("여")
    default:
        break
    }
}

showGender2(type: .man)


// CaseIterable

enum Beverage: String, CaseIterable {
    case coffee
    case juice
    case tea
}

let beverage = Beverage.allCases

beverage

for beverage in Beverage.allCases{
    print(beverage.rawValue + " 음료")
}

func findBeverage(name: String) {
    Beverage.allCases.forEach { beverage in
        if beverage.rawValue == name {
            print("타입에 맞는 음료가 있음. -> " + beverage.rawValue)
        }
    }
}

findBeverage(name: "juice")


// 타입을 선택 + 값을 정의

enum Rectangle {
    case triangle(width: Int, height: Int, angle: Int)
    case circle(radius: Int)
}

var triangle = Rectangle.triangle(width: 100, height: 50, angle: 90)
var circle = Rectangle.circle(radius: 10)

if case let Rectangle.triangle(width, height, angle) = triangle{
    print(width, height, angle)
}

func printRectangle(rectangle: Rectangle) {
    switch rectangle{
    case .triangle(let width, let height, let angle):
        print(width, height, angle)
    case .circle(let radius):
        print("radius", radius)
    default:
        break
    }
}

printRectangle(rectangle: triangle)
printRectangle(rectangle: circle)



