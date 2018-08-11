//: Problem - 6
// This problem was asked by Google.
//
// An XOR linked list is a more memory efficient doubly linked list.
// Instead of each node holding next and prev fields, it holds a field named both, which is an XOR of the next node and the previous node.
// Implement an XOR linked list; it has an add(element) which adds the element to the end, and a get(index) which returns the node at index.
//
// If using a language that has no pointers (such as Python), you can assume you have access to get_pointer and
// dereference_pointer functions that converts between nodes and memory addresses.
//
// start address: 0, increase by 1
// list:        empty
// command:     add(10)
//
//                    01
// list:        <- (10, 00) <-> null
//
// comamnd:     add(20)
//                    01            02
// list:        <- (10, 02) <-> (20, 01) <->
//
// command: add(50)
//                    01           02           03
// list:        <- (10, 02) <-> (20, 02) <-> (50, 02) ->
//
// command: add(60)
//                    01           02           03           04
// list:        <- (10, 02) <-> (20, 02) <-> (50, 06) -> (60, 03) ->

#include <iostream>
#include <stdint.h>

template <typename T>
struct Node {
    T value;
    Node *both;

    Node(T val): value(val), both(nullptr) {}
    Node(T val, Node *b): value(val), both(b) {}
    Node(Node *b): value(), both(b) {}
};

template <typename T>
class XORList {
public:
    XORList(): head(nullptr), tail(nullptr), cnt(0) { }

    void add(T value) {
        if (cnt == 0) {
            auto both = new Node<T>(xor_nodes(nullptr, nullptr));
            head = new Node<T>(value, both);
            tail = head;
        } else if (cnt == 1)  {
            auto newNode = new Node<T>(value, xor_nodes(head, nullptr));
            tail = newNode;
            head->both = xor_nodes(nullptr, tail);
        } else {
            auto newNode = new Node<T>(value, xor_nodes(tail, nullptr));
            auto oldPrev = xor_nodes(tail->both, nullptr);
            tail->both = xor_nodes(oldPrev, newNode);
            tail = newNode;
        }

        ++cnt;
    }

    T get(size_t index) {
        if (index >= cnt) {
            throw "Index out of range";
        }

        if (index == 0) {
            return head->value;
        }

        size_t i = 0;
        Node<T> *prev = nullptr;
        Node<T> *current = head;

        while (i++ < index) {
            auto newCurrent = xor_nodes(prev, current->both);
            prev = current;
            current = newCurrent;
        }

        return current->value;
    }

private:
    Node<T> *head;
    Node<T> *tail;
    size_t cnt;

    size_t count() {
        return cnt;
    }

    Node<T> * xor_nodes(Node<T> *left, Node<T> *right) {
        return (Node<T> *) ((uintptr_t (left)) ^ (uintptr_t (right)));
    }
};

// Driver
int main() {
    XORList<int> list;
    list.add(10);
    list.add(20);
    list.add(30);
    list.add(40);
    std::cout << list.get(0) << " " << list.get(1) << " " << list.get(2) << " " << list.get(3);
}
