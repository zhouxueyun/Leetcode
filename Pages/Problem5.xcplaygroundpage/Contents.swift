
import Foundation

/**
 Longest Palindromic Substring
 
 Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.
 
 Example 1:
 Input: "babad"
 Output: "bab"
 Note: "aba" is also a valid answer.
 
 Example 2:
 Input: "cbbd"
 Output: "bb"
 */

func longestPalindrome(_ str: String) -> String {
    guard str.count > 0 else {
        return ""
    }
    let array = Array(str)
    var left = 0, right = 0
    for index in 0..<array.count {
        let len = expandCenter(array, index, index)
        let len1 = expandCenter(array, index, index + 1)
        let maxLen = max(len, len1)
        if right - left < maxLen {
            left = index - (maxLen - 1) / 2
            right = index + maxLen / 2
        }
    }
    let startIndex = str.index(str.startIndex, offsetBy: left)
    let endIndex = str.index(str.startIndex, offsetBy: right)
    return String(str[startIndex...endIndex])
}

func expandCenter(_ array: [Character], _ left: Int, _ right: Int) -> Int{
    var l = left, r = right
    while l >= 0, r < array.count, array[l] == array[r] {
        l -= 1
        r += 1
    }
    return r - l - 1
}

longestPalindrome("aba")
longestPalindrome("babad")
longestPalindrome("cbbd")
longestPalindrome("aaaa")
longestPalindrome("abcdcdc")
longestPalindrome("aaabaaaa")
longestPalindrome("abcbaaaabcbc")
longestPalindrome("abcccccabc")
longestPalindrome("rgczcpratwyqxaszbuwwcadruayhasynuxnakpmsyhxzlnxmdtsqqlmwnbxvmgvllafrpmlfuqpbhjddmhmbcgmlyeypkfpreddyencsdmgxysctpubvgeedhurvizgqxclhpfrvxggrowaynrtuwvvvwnqlowdihtrdzjffrgoeqivnprdnpvfjuhycpfydjcpfcnkpyujljiesmuxhtizzvwhvpqylvcirwqsmpptyhcqybstsfgjadicwzycswwmpluvzqdvnhkcofptqrzgjqtbvbdxylrylinspncrkxclykccbwridpqckstxdjawvziucrswpsfmisqiozworibeycuarcidbljslwbalcemgymnsxfziattdylrulwrybzztoxhevsdnvvljfzzrgcmagshucoalfiuapgzpqgjjgqsmcvtdsvehewrvtkeqwgmatqdpwlayjcxcavjmgpdyklrjcqvxjqbjucfubgmgpkfdxznkhcejscymuildfnuxwmuklntnyycdcscioimenaeohgpbcpogyifcsatfxeslstkjclauqmywacizyapxlgtcchlxkvygzeucwalhvhbwkvbceqajstxzzppcxoanhyfkgwaelsfdeeviqogjpresnoacegfeejyychabkhszcokdxpaqrprwfdahjqkfptwpeykgumyemgkccynxuvbdpjlrbgqtcqulxodurugofuwzudnhgxdrbbxtrvdnlodyhsifvyspejenpdckevzqrexplpcqtwtxlimfrsjumiygqeemhihcxyngsemcolrnlyhqlbqbcestadoxtrdvcgucntjnfavylip")
