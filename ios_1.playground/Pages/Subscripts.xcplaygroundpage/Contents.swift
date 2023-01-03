
import Foundation

// Subscripts

var names = ["lee", "kim"]


var colorValue = ["red" : "100", "blue" : "001"]
colorValue["red"] = "빨강"


struct Member {
    var name: String
    var age: Int
}


let member1 = Member(name: "kim", age: 20)
let member2 = Member(name: "kim", age: 21)
let member3 = Member(name: "kim", age: 24)
let member4 = Member(name: "kim", age: 31)


let members = [member1, member2, member3, member4]


class Group {
    var members = [Member]()
    
    subscript(index: Int) -> Member {
        get{
            return members[index]
        }
        set{
           members[index] = newValue
        }
    }
}


let group = Group()
group.members = [member1, member2, member3, member4]
group[0].age
group[0].age = 30
group[0].age

// 나이대 -> 20대, 30대
class Group2 {
    
    enum AgeType {
        case _20s
        case _30s
    }
    
    var members = [Member]()
    
    subscript(ageGroup: AgeType) -> [Member] {
        get{
            var outputMembers = [Member]()
            
            for member in members {
                if ageGroup == ._20s && (20..<30 ~= member.age) {
                    outputMembers.append(member)
                }
                
                if ageGroup == ._30s && (30..<40 ~= member.age) {
                    outputMembers.append(member)
                }
            }
            return outputMembers
        }
       
    }
}

let group2 = Group2()

group2.members = [member1, member2, member3, member4]
group2[._20s]
group2[._30s]
