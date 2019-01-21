//: [Previous](@previous)

import Foundation

/**
 Compare Version Numbers
 
 Compare two version numbers version1 and version2.
 If version1 > version2 return 1; if version1 < version2 return -1;otherwise return 0.
 
 You may assume that the version strings are non-empty and contain only digits and the . character.
 
 The . character does not represent a decimal point and is used to separate number sequences.
 
 For instance, 2.5 is not "two and a half" or "half way to version three", it is the fifth second-level revision of the second first-level revision.
 
 You may assume the default revision number for each level of a version number to be 0. For example, version number 3.4 has a revision number of 3 and 4 for its first and second level revision number. Its third and fourth level revision number are both 0.
 
 Example 1:
 Input: version1 = "0.1", version2 = "1.1"
 Output: -1
 
 Example 2:
 Input: version1 = "1.0.1", version2 = "1"
 Output: 1
 
 Example 3:
 Input: version1 = "7.5.2.4", version2 = "7.5.3"
 Output: -1
 */

func compareVersion(_ version1: String, _ version2: String) -> Int {
    let comp1 = version1.components(separatedBy: ".")
    let comp2 = version2.components(separatedBy: ".")
    let size = min(comp1.count, comp2.count)
    for i in 0 ..< size {
        let ver1 = Int(comp1[i])!
        let ver2 = Int(comp2[i])!
        if ver1 > ver2 { return 1 }
        if ver1 < ver2 { return -1 }
    }
    for i in size ..< comp1.count {
        let ver = Int(comp1[i])!
        if ver != 0 { return 1 }
    }
    for i in size ..< comp2.count {
        let ver = Int(comp2[i])!
        if ver != 0 { return -1 }
    }
    return 0
}

compareVersion("0.1", "1.1")
compareVersion("1.0.1", "1")
compareVersion("7.5.2.4", "7.5.3")

