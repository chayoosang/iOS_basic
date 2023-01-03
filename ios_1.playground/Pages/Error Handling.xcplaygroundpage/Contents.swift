
import Foundation

// Error handling
// 에러 처리

enum MyError: Error {
    case invalidValue
    case outOfLimit
}


var number = 0

func squarArea(width: Int, height: Int) throws -> Int {
    if width < 0 || height < 0{
        throw MyError.invalidValue
    }
    
    if width > 100 || height > 100{
        throw MyError.outOfLimit
    }
    
    return width * height
}

func area(completion: (Int, Int) throws -> Int) rethrows -> Int {
    return try completion(101, 50)
}


do {
    try area(completion: squarArea)
}catch {
    print(error)
}




do {
    try squarArea(width: 100, height: 11)

}catch {
    print(error)
}
// error 발생 시 nil로 대체
try? squarArea(width: 1111, height: 11)
// error 발생하더라도 강제로 실행 -> 잘 사용하지 않음
try! squarArea(width: 1111, height: 11)
