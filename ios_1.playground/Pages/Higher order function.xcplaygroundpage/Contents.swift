import Foundation


// higher order function
// 고차함수

// Array
let names = ["lee", "min", "kim", "su"]

// Dictionary
let namesDic = ["lee" : "이", "min" : "민", "kim" : "김", "cha" : "차"]



// map
// element 변경 가능 / 단, 갯수는 변경 불가능
var newNames = [String]()

names.forEach{element in
    newNames.append(element + "님")
}

newNames

let newNames2 = names.map{$0 + "님"}

let newNames3 = names.map{$0.count}
newNames3

let newNamesDic = namesDic.map{ element in
    element.value
}
newNamesDic

// filter
// 가져오고 싶은 데이터만 가져온다.

names.filter { element in
    return element.count >= 3
}

names.filter {
    $0.count>=3
}

namesDic.filter { element in
    element.key.count >= 3
}


// map + filter

names.filter { element in
    element.count >= 3
}.map { element in
    element.count
}


let newNames5 = names.filter { $0.count >= 3}
     .map { $0.count}
newNames5


// reduce
// 컨테이너 값을 하나로 합친다

names.reduce("") { partialResult, element in
    partialResult + element
}


let newReduce = names.filter { $0.count >= 3}
                     .map { $0.count}
                     .reduce(0) {$0 + $1}
newReduce


// compactMap
// nil 제거, optional 바인딩

var numbers = [1, 2, 3, nil, 5, 6, 7, nil, 8]

var newNubers = numbers.compactMap{$0}
newNubers

var stringNumbers = ["1", "2", "3", nil, "5", "6", "7", nil, "aaaa"]
let compactValue = stringNumbers.compactMap { Int($0 ?? "") }
compactValue


// flatMap
// 이차 배열 -> 일차 배열

var doubleNubmers = [[1,2,3] , [5,6,7]]
doubleNubmers.flatMap { element in
    element
}
