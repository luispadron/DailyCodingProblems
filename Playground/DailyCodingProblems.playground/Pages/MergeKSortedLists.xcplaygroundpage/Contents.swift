//: Problem - Merge K Sorted Lists
//
// Return a new sorted merged list from K sorted lists, each with size N
// Example: Given [[10, 15, 30], [12, 15, 20], [17, 20, 32]], return [10, 12, 15, 15, 17, 20, 20, 30, 32]

import Foundation

/// RETURNS: a new sorted list which is the result of merging the given sorted lists.
/// EXPECTS: That both the given lists are already sorted
/// COMPLEXITY: O(n), where n is the size of the largest of the two lists
func mergeLists(_ list1: [Int], _ list2: [Int]) -> [Int] {
    var result = [Int]()

    var i = 0
    var j = 0
    while i < list1.count || j < list2.count {
        if (i < list1.count && j < list2.count) && list1[i] < list2[j] {
            result.append(list1[i])
            i += 1
        } else if (i < list1.count && j < list2.count) && list1[i] > list2[j] {
            result.append(list2[j])
            j += 1
        } else {
            if i < list1.count {
                result.append(list1[i])
                i += 1
            }
            if j < list2.count {
                result.append(list2[j])
                j += 1
            }
        }
    }
    return result
}

/// RETURNS: A new sorted merged list from K sorted lists
/// EXPECTS: That the given lists are already sorted
/// COMPLEXITY: O(nk^2) where k is the size of lists 2D array and n is the size of the largest list in that array
func mergeKLists(_ lists: [[Int]]) -> [Int] {
    var mergedLists = [Int]()

    for k in 0..<lists.count {
        mergedLists = mergeLists(mergedLists, lists[k])
    }

    return mergedLists
}

mergeKLists([[10, 15, 30], [12, 15, 20], [17, 20, 32]]) // -> [10, 12, 15, 15, 17, 20, 20, 30, 32]
mergeKLists([[1], [], [0, 10, 30], [4, 5]]) // -> [0, 1, 4, 5, 10, 30]
