//: Is Valid Parenthesis
// Given a string with parenthesis find if the parenthesis are valid,
// as in, does every opening parenthesis including a closing parenthesis
//
// Example1: "(())" -> True
// Example2: "())" -> False
//

import Foundation

// A stack data structure
struct Stack<Element> {
    private var container = Array<Element>()

    public mutating func push(_ value: Element) {
        container.append(value)
    }

    @discardableResult public mutating func pop() -> Element? {
        return container.popLast()
    }

    var isEmpty: Bool {
        return container.isEmpty
    }
}

/// Returns whether a string of parenthesis is valid
func isValidParenthesis(string: String) -> Bool {
    var stack = Stack<Character>()

    for char in string {
        switch char {
        case ")":
            guard stack.pop() == "(" else { return false }
        case "]":
            guard stack.pop() == "[" else { return false }
        case "}":
            guard stack.pop() == "{" else { return false }
        case "(", "[", "{":
            stack.push(char)
        default:
            return false
        }
    }

    return stack.isEmpty
}

// Test
var stack = Stack<Int>()
let example1 = "(())"
let example2 = "())"
let example3 = ""
let example4 = "("

isValidParenthesis(string: example1) // -> true
isValidParenthesis(string: example2) // -> false
isValidParenthesis(string: example3) // -> true
isValidParenthesis(string: example4) // -> false

