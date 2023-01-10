import Foundation
import UIKit

// iOS 15
// 동시성 프로그래밍
// async / await

// dispatchQueue, completion handler


func someWork() async -> Int {
    // 5초 정도 소요되는 func
    try? await Task.sleep(nanoseconds: 1000 * 1000 * 1000 * 5)
    return 5
}

func simpleWork() {
    print("dddd" + "bbbb" + "aaaa")
}


func start() {
    
    
    Task{
        print("start")
        let returnNumber = await someWork()
        print(returnNumber)
        print("finish")
        
    }
    simpleWork()
}

start()
