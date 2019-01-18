import Foundation

func minCut(_ s: String) -> Int {
    let len = s.count
    if len == 0 { return 0 }
    
    var matrix = [[Bool]](repeating: [Bool](repeating: false, count: len), count: len)
    var cuts = [Int](repeating: 0, count: len + 1)
    
    for i in 0 ..< len {
        cuts[i] = len - i // len, len-1, ..., 2, 1, 0
    }
    
    for i in (0 ... len-1).reversed() {
        for j in i ..< len {
            if s[s.index(s.startIndex, offsetBy: i)] == s[s.index(s.startIndex, offsetBy: j)]
                && (j-i < 2 || matrix[i+1][j-1]) { // i 和 j 刚好是对角的情况？？
                matrix[i][j] = true
                cuts[i] = min(cuts[i], cuts[j+1]+1)
            }
//            print(i, j)
//            for k in matrix {
//                print(k)
//            }
//            print(cuts)
        }
    }
    return cuts[0]-1;
}

minCut("aab")
minCut("ACDCDCDAD")

