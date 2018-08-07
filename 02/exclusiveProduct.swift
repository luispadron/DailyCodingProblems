//: Problem:
// This problem was asked by Uber.
//
// Given an array of integers, return a new array such that each element at index i of the new array is the
// product of all the numbers in the original array except the one at i.
//
// For example, if our input was [1, 2, 3, 4, 5], the expected output would be [120, 60, 40, 30, 24].
// If our input was [3, 2, 1], the expected output would be [2, 3, 6].
//
// Follow-up: what if you can't use division?

extension Array where Element == Int {
    private func product(excluding index: Int) -> Int {
        return enumerated().reduce(1, { product, current -> Int in
            if current.offset == index { return product }
            else { return product * current.element }
        })
    }

    // Complexity: O(n^2) but really cool and functional!
    func exclusiveProduct() -> [Int] {
        return enumerated().map { product(excluding: $0.offset) }
    }

    // Complexity: O(n), uses division
    func exclusiveProductWithDiv() -> [Int] {
        let product = reduce(1, { (x, y) in x * y })
        let products = Array(repeating: product, count: self.count)
        return products.enumerated().map { $0.element / self[$0.offset] }
    }

    // Complexity: O(n), no division!
    func exclusiveProductFinal() -> [Int] {
        var left = Array(repeating: 1, count: self.count)
        var right = Array(repeating: 1, count: self.count)

        // Make left
        for i in 1..<self.count {
            left[i] = left[i - 1] * self[i - 1]
        }

        // Make right
        for i in (0..<self.count - 1).reversed() {
            right[i] = right[i + 1] * self[i + 1]
        }

        // Combine
        var result = [Int]()
        for i in 0..<self.count {
            result.append(left[i] * right[i])
        }

        return result
    }
}

// Brute force
[1, 2, 3, 4, 5].exclusiveProduct() // -> [120, 60, 40, 30, 24]
[3, 2, 1].exclusiveProduct() // -> [2, 3, 6]

// Using division
[1, 2, 3, 4, 5].exclusiveProductWithDiv() // -> [120, 60, 40, 30, 24]
[3, 2, 1].exclusiveProductWithDiv() // -> [2, 3, 6]

[1, 2, 3, 4, 5].exclusiveProductFinal() // -> [120, 60, 40, 30, 24]
[3, 2, 1].exclusiveProductFinal() // -> [2, 3, 6]

