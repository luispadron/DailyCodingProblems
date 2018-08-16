//: Problem - All possible subsets
//
// Given a set of distinct integers, nums, return all possible subsets (the power set).
//
// Note: The solution set must not contain duplicate subsets.
//
// Example:
//
// Input: nums = [1,2,3]
// Output:
//    [
//        [3],
//        [1],
//        [2],
//        [1,2,3],
//        [1,3],
//        [2,3],
//        [1,2],
//        []
//    ]
//

import Foundation

extension Array {
    /// Returns a new array after appending given element to current array
    func appending(_ element: Element) -> [Element] {
        var newArray = self
        newArray.append(element)
        return newArray
    }
}

func subsetsHelper(original: [Int], container: [Int], subsets: inout [[Int]], index: Int) {
    guard index < original.count else {
        subsets.append(container)
        return
    }

    subsetsHelper(original: original, container: container, subsets: &subsets, index: index + 1) // exclude
    subsetsHelper(original: original, container: container.appending(original[index]), subsets: &subsets, index: index + 1) // include
}

func allPossibleSubsets(of array: [Int]) -> [[Int]] {
    var subsets = [[Int]]()

    subsetsHelper(original: array, container: [], subsets: &subsets, index: 0)

    return subsets
}

//////////////////////// TESTS ////////////////////////

print(allPossibleSubsets(of: [1, 2, 3]))
print(allPossibleSubsets(of: [1, 2]))
print(allPossibleSubsets(of: []))
print(allPossibleSubsets(of: [1]))


