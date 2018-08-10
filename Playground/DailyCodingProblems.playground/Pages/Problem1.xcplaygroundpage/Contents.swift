//: Problem - 1
// Given a list of numbers and a number k, return whether any two numbers from the list add up to k.
//
// For example, given [10, 15, 3, 7] and k of 17, return true since 10 + 7 is 17.
//
// Bonus: Can you do this in one pass?

import Foundation

extension Array where Element == Int {

    // Complexity: O(n^2) - bad
    func doesSumQuadriatic(to k: Int) -> Bool {
        for (i, num) in enumerated() {
            let target =  k - num
            if let j = index(of: target), j != i { return true }
        }

        return false
    }

    // Complexity: O(n)
    // One pass!
    func doesSum(to k: Int) -> Bool {
        var dict = [Int: Int]()
        for (i, n) in enumerated() {
            let target = k - n
            if let index = dict[target], index != i {
                return true

            } else {
                dict[n] = i
            }
        }

        return false
    }
}

[1, 2, 3, 4].doesSumQuadriatic(to: 3) // true
[0, 1, 2, 3].doesSumQuadriatic(to: 1) // true
[10, 11, 33, 0, -1, 8].doesSumQuadriatic(to: 9) // true
[0, 0, 0, 0, 1].doesSumQuadriatic(to: 2) // false

[1, 2, 3, 4].doesSum(to: 3) // true
[0, 1, 2, 3].doesSum(to: 1) // true
[10, 11, 33, 0, -1, 8].doesSum(to: 9) // true
[0, 0, 0, 0, 1].doesSum(to: 2) // false

