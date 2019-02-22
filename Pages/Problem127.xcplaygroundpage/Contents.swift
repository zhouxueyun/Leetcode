
import Foundation

/**
 Word Ladder
 
 Given two words (beginWord and endWord), and a dictionary's word list, find the length of shortest transformation sequence from beginWord to endWord, such that:
 
 Only one letter can be changed at a time.
 Each transformed word must exist in the word list. Note that beginWord is not a transformed word.
 Note:
 
 Return 0 if there is no such transformation sequence.
 All words have the same length.
 All words contain only lowercase alphabetic characters.
 You may assume no duplicates in the word list.
 You may assume beginWord and endWord are non-empty and are not the same.
 
 Example 1:
 Input:
 beginWord = "hit",
 endWord = "cog",
 wordList = ["hot","dot","dog","lot","log","cog"]
 Output: 5
 Explanation: As one shortest transformation is "hit" -> "hot" -> "dot" -> "dog" -> "cog",
 return its length 5.
 
 Example 2:
 Input:
 beginWord = "hit"
 endWord = "cog"
 wordList = ["hot","dot","dog","lot","log"]
 Output: 0
 Explanation: The endWord "cog" is not in wordList, therefore no possible transformation.
 */

func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
    var wordSet = Set(wordList)
    if !wordSet.contains(endWord) { return 0 }

    var dist = 0
    var visited = [beginWord]
    
    while !visited.isEmpty {
        // 将上一次visited的word，分别查找相邻word，且从visited中移除
        for _ in 0..<visited.count {
            let word = visited.removeFirst()
            if word == endWord { return dist + 1 }
            // 查找所有可能的相邻word，并记录visited，从wordSet中移除
            for i in 0..<word.count {
                var wordArr = Array(word)
                for j in 0..<26 {
                    wordArr[i] = Character(UnicodeScalar((UnicodeScalar("a")!.value + UInt32(j)))!);
                    let newWord = String(wordArr)
                    if wordSet.contains(newWord) && newWord != word {
                        visited.append(newWord)
                        wordSet.remove(newWord)
                    }
                }
            }
        }
        // 一圈之后对长度进行+1
        dist += 1
    }
    
    return 0;
}
