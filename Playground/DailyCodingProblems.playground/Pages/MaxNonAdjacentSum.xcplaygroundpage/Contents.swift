// Promblem - Max non-adjacent sum
//
// This problem was asked by Airbnb.
//
// Given a list of integers, write a function that returns the largest sum of non-adjacent numbers. Numbers can be 0 or negative.
//
// For example, [2, 4, 6, 2, 5] should return 13, since we pick 2, 6, and 5. [5, 1, 1, 5] should return 10, since we pick 5 and 5.
//
// Follow-up: Can you do this in O(N) time and constant space?
//

import Foundation

extension Array where Element == Int {
    /// Returns the maximum sum of the array where elements cannot be adjacent.
    /// Time complexity: O(n), Space Complexity: O(1)
    func maxNonAdjacentSum() -> Int {
        var inclusive = 0
        var exclusive = 0

        for num in self {
            let prevInclusive = inclusive
            inclusive = Swift.max(inclusive, exclusive + num)
            exclusive = prevInclusive
        }

        return Swift.max(inclusive, exclusive)
    }
}

/////////// Tests //////////

[2, 4, 6, 2, 5].maxNonAdjacentSum() // -> 13
[5, 1, 1, 5].maxNonAdjacentSum() // -> 10
[].maxNonAdjacentSum() // -> 0
[0, 0, -1].maxNonAdjacentSum() // -> 0
[-1, -2, -3, -5].maxNonAdjacentSum() // -> 0
[-1, -2, 2, 0, 1].maxNonAdjacentSum() // -> 3
