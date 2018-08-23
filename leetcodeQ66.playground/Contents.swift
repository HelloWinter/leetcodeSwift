//: Playground - noun: a place where people can play

import Foundation

/**加一
 给定一个由整数组成的非空数组所表示的非负整数，在该数的基础上加一。
 
 最高位数字存放在数组的首位， 数组中每个元素只存储一个数字。
 
 你可以假设除了整数 0 之外，这个整数不会以零开头。
 
 示例 1:
 
 输入: [1,2,3]
 输出: [1,2,4]
 解释: 输入数组表示数字 123。
 示例 2:
 
 输入: [4,3,2,1]
 输出: [4,3,2,2]
 解释: 输入数组表示数字 4321。
 */

func plusOne(_ digits: [Int]) -> [Int] {
    var digitStr = ""
    for digit in digits {
        digitStr += "\(digit)"
    }
    var arr = [Int]()
    if var num = toInt(digitStr) {
        num += 1
        while num / 10 > 0 {
            let subNum = num % 10
            arr.insert(subNum, at: 0)
            num /= 10
        }
        arr.insert(num, at: 0)
        return arr
    }
    return []
}

func toInt(_ str : String) -> Int?{
    return NumberFormatter().number(from: str)?.intValue
}

plusOne([9,9,9,9])
