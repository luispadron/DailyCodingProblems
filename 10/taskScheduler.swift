//: Problem - Task Scheduler
//
// Given a char array representing tasks CPU need to do. It contains capital letters A to Z where
// different letters represent different tasks.Tasks could be done without original order.
// Each task could be done in one interval. For each interval, CPU could finish one task or just be idle.
//
// However, there is a non-negative cooling interval n that means between two same tasks,
// there must be at least n intervals that CPU are doing different tasks or just be idle.
//
// You need to return the least number of intervals the CPU will take to finish all the given tasks.
//
// Example:
//
// Input: tasks = ["A","A","A","B","B","B"], n = 2
// Output: 8
// Explanation: A -> B -> idle -> A -> B -> idle -> A -> B.
//

// Helper
extension Character {
    func unicodeIndex() -> Int {
        return Int(self.unicodeScalars.first!.value - "A".unicodeScalars.first!.value)
    }
}

func totalCycles(toFinish tasks: [Character], coolDown: Int) -> Int {
    var taskCounts = Array(repeating: 0, count: 26)
    tasks.forEach { taskCounts[$0.unicodeIndex()] += 1 }
    taskCounts.sort()

    var cycles = 0
    while let highestTask = taskCounts.last, highestTask > 0 {
        var performed = 0

        while performed <= coolDown, let highestTask = taskCounts.last, highestTask > 0 {
            if performed < 26 && taskCounts[25 - performed] > 0 {
                taskCounts[25 - performed] -= 1
            }

            performed += 1
            cycles += 1
        }

        taskCounts.sort()
    }

    return cycles
}

totalCycles(toFinish: ["A", "A", "A", "B", "B", "C"], coolDown: 2)

