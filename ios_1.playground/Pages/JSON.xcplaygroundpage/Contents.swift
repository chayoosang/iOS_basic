import Foundation

// JSON

// text 정보를 주고 받을 때
// array, dictionary(object) key : value

/*
 
// array
["a", "b", "c"]
[20, [1, 2], "c"]

// object
{ "name" : {"color" : "red"}}

// object in array
[
    { "name" : {"color" : "red"}}
]
 
*/


let json =
"""
[
    {
    "name" : "Banana",
    "points" : 200,
    "desciption" : "A banana grown in Ecuador"
    },
    {
    "name" : "Orange",
    "points" : 100
    }
]
""".data(using: .utf8)!


struct Fruits: Decodable {
    var name: String
    var points: Int
    var desciption: String?
}



// json -> [dictionary]

let jsonObj = JSONSerialization.jsonObject(with: json) as? [[String : Any ]]
jsonObj



//let simpleString = "\"success\"".data(using: .utf8)
let simpleString = """
"success"
""".data(using: .utf8)!


let stringObj = JSONSerialization.jsonObject(with: simpleString, options: .fragmentsAllowed) as? String
print(stringObj)


//JSONDecoder: data -> read
//JSONEncoder: read -> data

do{
    let fruits = try JSONDecoder().decode([Fruits].self, from: json)
    fruits[0].name
}catch {
    print(error)
}
