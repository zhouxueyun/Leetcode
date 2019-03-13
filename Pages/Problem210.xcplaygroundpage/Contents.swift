
import Foundation

/**
 Course Schedule II
 
 There are a total of n courses you have to take, labeled from 0 to n-1.
 
 Some courses may have prerequisites, for example to take course 0 you have to first take course 1, which is expressed as a pair: [0,1]
 
 Given the total number of courses and a list of prerequisite pairs, return the ordering of courses you should take to finish all courses.
 
 There may be multiple correct orders, you just need to return one of them. If it is impossible to finish all courses, return an empty array.
 
 Example 1:
 Input: 2, [[1,0]]
 Output: [0,1]
 Explanation: There are a total of 2 courses to take. To take course 1 you should have finished
 course 0. So the correct course order is [0,1] .
 
 Example 2:
 Input: 4, [[1,0],[2,0],[3,1],[3,2]]
 Output: [0,1,2,3] or [0,2,1,3]
 Explanation: There are a total of 4 courses to take. To take course 3 you should have finished both
 courses 1 and 2. Both courses 1 and 2 should be taken after you finished course 0.
 So one correct course order is [0,1,2,3]. Another correct ordering is [0,2,1,3] .
 
 Note:
 The input prerequisites is a graph represented by a list of edges, not adjacency matrices. Read more about how a graph is represented.
 You may assume that there are no duplicate edges in the input prerequisites.
 */

class Solution {
    // BFS
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var inArr = [Int](repeating: 0, count: numCourses)
        var graph = [[Int]](repeating: [Int](), count: numCourses)
        prerequisites.forEach({
            graph[$0[1]].append($0[0])
            inArr[$0[0]] += 1 // 入度，有几个值可以到达此值
        })
        var order = [Int]()
        var queue = [Int]()
        for i in 0..<numCourses {  // 入度为0，需要先行处理
            if inArr[i] == 0 { queue.append(i) }
        }
        while !queue.isEmpty {
            let i = queue.removeFirst()
            order.append(i)
            for j in graph[i] {
                inArr[j] -= 1
                if inArr[j] == 0 { queue.append(j) }
            }
        }
        for i in 0..<numCourses {
            if inArr[i] != 0 { return [] }
        }
        return order
    }
}

let s = Solution()
s.findOrder(2, [[1, 0]])
s.findOrder(4, [[1,0],[2,0],[3,1],[3,2]])
