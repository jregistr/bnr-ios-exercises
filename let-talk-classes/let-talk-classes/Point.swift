//
// Created by Registre, Jeff on 2/11/20.
// Copyright (c) 2020 jregistr. All rights reserved.
//

import Foundation

struct Point {

    var x: Double
    var y: Double
}

extension Point : Equatable {
    static func ==(lhs: Point, rhs: Point) -> Bool {
        lhs.x == rhs.x && lhs.y == rhs.y
    }
}

extension Point : Comparable {

    static func <(lhs: Point, rhs: Point) -> Bool {
        func squared(_ value: Double) -> Double {
            value * value
        }

        func euclidDistForPoint(_ p: Point) -> Double {
            let axbxsq = squared(p.x)
            let aybysq = squared(p.y)
            return (axbxsq + aybysq).squareRoot()
        }

        let ld = euclidDistForPoint(lhs)
        let rd = euclidDistForPoint(rhs)

        return ld < rd
    }
}