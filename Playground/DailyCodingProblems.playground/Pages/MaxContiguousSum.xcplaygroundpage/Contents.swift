//: Problem - Maximum sum of contiguous subarray
//
// Given an integer array nums, find the contiguous subarray (containing at least one number)
// which has the largest sum and return its sum.
//
// Example:
//
// Input: [-2,1,-3,4,-1,2,1,-5,4],
// Output: 6
// Explanation: [4,-1,2,1] has the largest sum = 6.
//

extension Array where Element == Int {
    func maxContiguousSum() -> Int {
        guard !self.isEmpty else { return 0 }

        var bestSoFar = self[0]

        for i in 0..<self.count {
            var total = self[i]
            bestSoFar = Swift.max(total, bestSoFar)

            for j in (i + 1)..<self.count {
                total += self[j]
                bestSoFar = Swift.max(total, bestSoFar)
            }
        }

        return bestSoFar
    }

    func maxContiguousSumFast() -> Int {
        guard !self.isEmpty else { return 0 }

        var bestSoFar = self[0]
        var previous = self[0]

        for i in 1..<self.count {
            previous = previous > 0 ? previous + self[i] : self[i]
            bestSoFar = Swift.max(bestSoFar, previous)
        }

        return bestSoFar
    }
}

////////// Test ///////////

[-2, 1, -3, 4, -1, 2, 1, -5, 4].maxContiguousSum() // -> 6
[].maxContiguousSum() // -> 0
[-1, -2, -3].maxContiguousSum() // -> -1
[-10, 100, -10000].maxContiguousSum() // -> 100
[-2, 1].maxContiguousSum() // -> 1

[-2, 1, -3, 4, -1, 2, 1, -5, 4].maxContiguousSumFast() // -> 6
[].maxContiguousSumFast() // -> 0
[-1, -2, -3].maxContiguousSumFast() // -> -1
[-10, 100, -10000].maxContiguousSumFast() // -> 100
[-2, 1].maxContiguousSumFast() // -> 1
