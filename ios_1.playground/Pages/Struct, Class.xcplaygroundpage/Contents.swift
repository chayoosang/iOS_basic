import Foundation

// Struct, Class
// 구조체, 클래스


// 생성
// 구조체와 클래스는 무조건 초기값이 필요하다
// 선언 시 초기값을 설정 할 수도 있음
// memberwise initializaer (init이 자동으로 생성)
struct Score1 {
    // property -> struct, class 안에 속해 있는 변수 및 상수
    var myScore: Int
    var yourScore:Int
    
    // method -> struct, class 안에 속해 있는 Function
    func presentScore(){
        print(myScore, yourScore)
    }
}

// 구조체는 init이 없어도 parameter로 초기값을 설정 할 수 있다. -> 구조체의 init
var score1 = Score1(myScore: 0, yourScore: 0)

score1.myScore = 100
score1.presentScore()

// struct -> Value Type (복사)
// 각각 따로 관리되기 때문에 원본에 대한 관리가 필요 없음
// Copy on Write -> 복사에 많은 메모리를 사용하는것을 방지하기 위해서 참조를 하다가 해당 값을 쓸 때 복사를 시작 함
var structScore = score1
structScore.yourScore = 100
score1.yourScore



// 클래스는 init이 있어야 parameter로 초기값을 설정 할 수 있다.
// 자바의 생성자와 비슷한 개념
class Score2 {
    var myScore: Int
    var yourScore: Int
    
    init(myScore: Int, yourScore: Int) {
        self.myScore = myScore
        self.yourScore = yourScore
    }
    
    func presentScore(){
        print(myScore, yourScore)
    }
}


var score2 = Score2(myScore: 0, yourScore: 0)
score2.yourScore = 50
score2.presentScore()

// class -> Reference Type (참조)
// 원본에 대한 관리 필요 -> 멀티 스레드 환경에서 오류 발생 가능성
var classScore = score2
classScore.myScore = 100
score2.myScore


let ss = score2

