//: Problem - Decode String
//
// This problem was asked by Facebook.
//
// Given the mapping a = 1, b = 2, ... z = 26, and an encoded message, count the number of ways it can be decoded.
//
// For example, the message '111' would give 3, since it could be decoded as 'aaa', 'ka', and 'ak'.
//
// You can assume that the messages are decodable. For example, '001' is not allowed.
//

import Foundation

// Complexity: O(2^n)
func decodeRecursive(_ string: [Character], length: Int) -> Int {
    // Base case, only one possible solution
    if length == 0 || length == 1 {
        return 1
    }

    var count = 0

    if string[length - 1] > "0" {
        count = decodeRecursive(string, length: length - 1)
    }

    if string[length - 2] == "1" || (string[length - 2] == "2" && string[length - 2] < "7") {
        count += decodeRecursive(string, length: length - 2)
    }

    return count
}

func decodeDP(_ string: [Character], length: Int) -> Int {
    var result = Array(repeating: 0, count: length + 1)
    result[0] = 1
    result[1] = 1

    for i in 2...length {
        result[i] = 0

        if string[length - 1] > "0" {
            result[i] = result[i - 1]
        }

        if string[length - 2] == "1" || (string[length - 2] == "2" && string[length - 2] < "7") {
            result[i] += result[i - 2]
        }
    }

    return result[length]
}

decodeRecursive(Array("111"), length: 3) // -> 3
decodeDP(Array("111"), length: 3) // -> 3

