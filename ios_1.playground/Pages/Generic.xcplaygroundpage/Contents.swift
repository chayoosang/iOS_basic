import Foundation

// Generic

// 로직은 같은데 -> 그 안에 타입만 바뀌는 경우
// 호출 할 때 parmeter의 입력 값을 보고 타입을 정의

func plus<T>(a: T, b: T) -> T where T: Numeric, T: Comparable{
    if a > b {
        print("a")
    }
    return a + b
}

plus(a: 20, b: 30)
plus(a: 20.0, b: 30.4)
plus(a: 333, b: 30.4)



// Stack

class Stack<T> {
    var items = [T]()
    
    func push(item: T) {
        items.append(item)
    }
    
    func pop() -> T {
        return items.removeLast()
    }
    
}

var stringStack = Stack<String>()

stringStack.push(item: "a")
stringStack.push(item: "b")
stringStack.push(item: "c")
stringStack.items

stringStack.pop()
stringStack.items


var intStack = Stack<Int>()

intStack.push(item: 1)
intStack.push(item: 2)
intStack.push(item: 3)
intStack.items

intStack.pop()
intStack.items


// Stack + Generic + Protocol

protocol Stackable {
    associatedtype T
    
    func push(item: T)
    
    func pop() -> T
}


class Stack2<T>: Stackable {
   
    var items = [T]()
    
    func push(item: T) {
        items.append(item)
    }
    
    func pop() -> T {
        return items.removeLast()
    }
    
}


class Stack3: Stackable {
   typealias T = Int
    
    var items = [T]()
    
    func push(item: T) {
        items.append(item)
    }
    
    func pop() -> T {
        return items.removeLast()
    }
    
}
