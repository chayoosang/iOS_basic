import Foundation

// Type Castiong (타입 변환) -> 상속, protocol 규격에 맞는 Type만 가능
// Type Conversion (타입 변환) -> 거의 모두 가능


// conversion

var doubleNum: Double = 5.5

// Double -> Int
var intNum = Int(doubleNum)
Double(intNum)

// Int -> String
String(intNum)


// casting

class MainClass {
    
}

class Sub1Class: MainClass {
    var imSub = ""
}


var sub1 = Sub1Class()
sub1.imSub = "im sub"
sub1.imSub


// Sub1Class -> MainClass (Up Casting)
// 무조건 된다는 보장이 있음
var newMain = sub1 as MainClass

// MainClass -> Sub1Class (Down Casting)
// 무조건 된다는 보장이 없음 -> 강제로 casting 해야 함
var newSub = newMain as! Sub1Class
newSub.imSub

// as? -> 안되면 nil 값으로 처리
newMain as? Sub1Class


class Media {
    var name = ""
}

class Picture: Media {
    var size = ""
}

class Movie: Media {
    var lenght = 0
}

var mediaList = [Media]()

let pic1 = Picture()
pic1.size = "400 x 300"
pic1.name = "p1"

let pic2 = Picture()
pic2.size = "80 x 30"
pic2.name = "p2"


let movie1 = Movie()
movie1.lenght = 100
movie1.name = "m1"

mediaList.append(pic1)
mediaList.append(pic2)
mediaList.append(movie1)


if let pic = mediaList[0] as? Picture {
    print(pic.size)
}else if let movie = mediaList[0] as? Movie {
    print(movie.lenght)
}

(mediaList[0] as? Picture)?.size

mediaList[0] is Movie
mediaList[0] is Picture

for media in mediaList {
    if let pic = media as? Picture {
        print(pic.size)
    }else if let movie = media as? Movie {
        print(movie.lenght)
    }
}
