//: First missing positive
//
// This problem was asked by Stripe.
//
// Given an array of integers, find the first missing positive integer in linear time and constant space.
// In other words, find the lowest positive integer that does not exist in the array.
// The array can contain duplicates and negative numbers as well.
//
// For example, the input [3, 4, -1, 1] should give 2. The input [1, 2, 0] should give 3.
//
// You can modify the input array in-place.

import Foundation

extension Array where Element == Int {
    /// Moves all the non-positive integers to the left subsection of the array
    /// returns the start index of the subsection of the array with only positive integers
    mutating func segregate() -> Int {
        var start = startIndex
        for (index, num) in enumerated() {
            guard num <= 0 else { continue }
            swapAt(index, start)
            start += 1
        }

        return start == 0 ? start : start - 1
    }

    /// Returns the first missing positive integer in the given subsequence [start, end)
    /// Side-effect: Modifies the array
    mutating func firstMissing() -> Int? {
        // Move all negatives/zero's to left of array
        let start = segregate()

        // Visit array[array[i] - 1], mark as visited (make it negative)
        for i in start..<count {
            let num = abs(self[i])
            let index = num - 1 + start
            guard index < count && self[index] > 0 else { continue }
            self[index] *= -1
        }

        for i in start..<count {
            guard self[i] > 0 else { continue }
            return i + 1
        }

        return count - start
    }
}

var test1 = [3, 4, -1, 1]
test1.firstMissing() // -> 2

var test2 = [-1, -2, -1]
test2.firstMissing() // -> 1

var test3 = [1, 1, 1, 2, 3, 4, 5]
test3.firstMissing() // -> 6



