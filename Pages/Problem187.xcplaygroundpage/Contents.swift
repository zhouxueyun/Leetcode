
import Foundation

/**
 Repeated DNA Sequences
 
 All DNA is composed of a series of nucleotides abbreviated as A, C, G, and T, for example: "ACGAATTCCG". When studying DNA, it is sometimes useful to identify repeated sequences within the DNA.
 Write a function to find all the 10-letter-long sequences (substrings) that occur more than once in a DNA molecule.
 
 Example:
 Input: s = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"
 Output: ["AAAAACCCCC", "CCCCCAAAAA"]
 */

func findRepeatedDnaSequences(_ s: String) -> [String] {
    var ret = Set<String>()
    var set = Set<Int>()
    let map = ["A": 0, "C": 1, "G": 2, "T": 3]
    var val = 0
    for i in 0..<s.count { // 10-letter-long
        let char = String(s[s.index(s.startIndex, offsetBy: i)])
        val = (val << 2 | map[char]!) & Int(0xfffff)
        if i < 9 { continue }
        if set.contains(val) {
            let sub = String(s[s.index(s.startIndex, offsetBy: i-9)...s.index(s.startIndex, offsetBy: i)])
            ret.insert(sub)
        } else {
            set.insert(val)
        }
    }
    return Array(ret)
}

findRepeatedDnaSequences("")
findRepeatedDnaSequences("AAAAAAAAAAA")
findRepeatedDnaSequences("AAAAAAAAAAAA")
findRepeatedDnaSequences("AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT")
