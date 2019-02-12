
import Foundation

/**
 Restore IP Addresses
 
 Given a string containing only digits, restore it by returning all possible valid IP address combinations.
 
 Example:
 Input: "25525511135"
 Output: ["255.255.11.135", "255.255.111.35"]
 */

func restoreIpAddresses(_ s: String) -> [String] {
    var ret = [String]()
    helper(Array(s), 4, 0, "", &ret)
    return ret
}

func helper(_ arr: [Character], _ remain: Int, _ pos: Int, _ curr: String, _ ret: inout [String]) {
    if arr.count - pos < remain || arr.count - pos > remain * 3 {
        return
    }
    if remain == 0 {
        var ip = curr
        ip.removeLast()
        ret.append(ip)
        return
    }
    for i in 1...3 {
        if i > 1 && arr[pos] == "0" {
            continue
        }
        if pos + i <= arr.count {
            let str = String(arr[pos..<pos+i])
            if Int(str)! <= 255 {
                var ip = curr
                ip.append(str)
                ip.append(".")
                helper(arr, remain-1, pos+i, ip, &ret)
            }
        }
    }
}

restoreIpAddresses("010010")
restoreIpAddresses("25525511135")
