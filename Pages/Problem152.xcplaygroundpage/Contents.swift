
import Foundation

func maxProduct(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {
        return 0
    }
    var product = [Int](repeating: 0, count: nums.count)
    product[0] = nums[0]
    
    var maxNum = nums[0]
    var negtiveIndex = nums[0] < 0 ? 0 : -1;
    for i in 1 ..< nums.count {
        if nums[i] == 0 {
            product[i] = 0
        }
        else if nums[i] > 0 { // postive
            product[i] = max(nums[i], product[i-1] * nums[i])
        }
        else { // negtive
            if negtiveIndex == -1 {
                product[i] = nums[i]
            } else {
                // 两个负数范围内求积，再比较
                var tmp = 1
                for j in negtiveIndex...i {
                    tmp *= nums[j]
                }
                if negtiveIndex == 0 {
                    product[i] = tmp
                } else {
                    product[i] = max(product[negtiveIndex - 1] * tmp, tmp)
                }
            }
            negtiveIndex = i
        }
        maxNum = max(maxNum, product[i])
    }
    return maxNum
}


//Input: [2,3,-2,4]
//Output: 6
maxProduct([2,3,-2,4])

//Input: [-2,0,-1]
//Output: 0
maxProduct([-2,0,-1])
