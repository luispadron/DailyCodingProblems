//: Problem - Uinval Tree Count
//
// This problem was asked by Google.
//
// A unival tree (which stands for "universal value") is a tree where all nodes under it have the same value.
//
// Given the root to a binary tree, count the number of unival subtrees.
//
// For example, the following tree has 5 unival subtrees:
//
//         0
//        / \
//       1    0
//           / \
//          1   0
//         / \
//        1   1
//
// Result -> 5
//
// Pseudo code:
//      func countTree():
//          if !left and !right: return 1
//          subCounts = count(left) + count(right)
//          return subCounts + (left.val = self.val and right.val = self.val) ? 1 : 0
//

/// Node type for use with tree
final class Node<T: Equatable> {
    var value: T?
    var left: Node?
    var right: Node?

    init(value: T, left: Node? = nil, right: Node? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
}

// Helper to see if tree looks fine
extension Node {
    func printPreOrder() {
        preOrder(startingAt: self)
    }

    private func preOrder(startingAt root: Node) {
        print(root.value ?? "nil")
        if let left = root.left { preOrder(startingAt: left) }
        if let right = root.right { preOrder(startingAt: right) }
    }
}

// Construct tree that looks like above diagram
// Left leaf
let nodeOne1 = Node<Int>(value: 1)

// Leaves
let nodeOne2 = Node<Int>(value: 1)
let nodeOne3 = Node<Int>(value: 1)
let nodeZero1 = Node<Int>(value: 0)

// Parents
let nodeOneP = Node<Int>(value: 1, left: nodeOne2, right: nodeOne3)
let nodeZeroP = Node<Int>(value: 0, left: nodeOneP, right: nodeZero1)

let root = Node<Int>(value: 0, left: nodeOne1, right: nodeZeroP)
root.printPreOrder()

/////////////////////////// Algorithm ///////////////////////////

extension Node {
    func countUnival() -> Int {
        return Node.countUnival(startingAt: self)
    }

    private static func countUnival(startingAt root: Node?) -> Int {
        guard let root = root, let rootVal = root.value else { return 0 }
        // Base case
        if root.left == nil && root.right == nil { return 1 }

        let childCounts = countUnival(startingAt: root.left) + countUnival(startingAt: root.right)

        // Check if current root is a unival subtree
        if let leftVal = root.left?.value, let rightVal = root.right?.value {
            return childCounts + (leftVal == rootVal && rightVal == rootVal ? 1 : 0)
        } else if let leftVal = root.left?.value {
            return childCounts + (leftVal == rootVal ? 1 : 0)
        } else if let rightVal = root.right?.value {
            return childCounts + (rightVal == rootVal ? 1 : 0)
        } else {
            return childCounts
        }
    }
}

// Tests

root.countUnival() // -> 5

//
//          1
//         / \
//        0   1
//      /  \
//     1    0
//           \
//            1
//
// Result -> 3

let root2 = Node<Int>(value: 1)
root2.left = Node<Int>(value: 0)
root2.right = Node<Int>(value: 1)
root2.left?.left = Node<Int>(value: 1)
root2.left?.right = Node<Int>(value: 0)
root2.left?.right?.right = Node<Int>(value: 1)
root2.countUnival() // -> 3



