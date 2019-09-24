//===----------------------------------------------------------------------===//
//
// This source file is part of the SwiftNIO open source project
//
// Copyright (c) 2017-2018 Apple Inc. and the SwiftNIO project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of SwiftNIO project authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//
import NIO
import Foundation


let eventLoopGroup = MultiThreadedEventLoopGroup(numberOfThreads: System.coreCount)

let promise = eventLoopGroup.next().makePromise(of: Int.self)
let feture = promise.futureResult

DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
    print("execute --------")
    promise.succeed(22)
}

DispatchQueue.global().async {
    print("222 before")
    try? feture.wait()
    print("222 After")
}

DispatchQueue.global().async {
    print("333 before")
    try? feture.wait()
    print("333 After")
}
DispatchQueue.global().async {
    print("444 before")
    try? feture.wait()
    print("444 After")
}

//print("feature")
//try eventLoopGroup.next().makePromise(of: Void.self).futureResult.wait()
print("feature------")

//class X {
//    static let once: () = { print("22") }()
//    func start() {
//        _ = once
//    }
//}
//
//
//start()
//start()
