//: Playground - noun: a place where people can play

import Foundation

/**二进制求和
 给定两个二进制字符串，返回他们的和（用二进制表示）。
 
 输入为非空字符串且只包含数字 1 和 0。
 
 示例 1:
 
 输入: a = "11", b = "1"
 输出: "100"
 示例 2:
 
 输入: a = "1010", b = "1011"
 输出: "10101"
 */

func addBinary(_ a: String, _ b: String) -> String {
    let num = binaryToDec(a) + binaryToDec(b)
    return String(num, radix: 2, uppercase: false)
}

func binaryToDec(_ num : String) -> Int{
    var sum = 0
    for c in num {
        sum = sum * 2 + Int("\(c)")!
    }
    return sum
}

//binaryToDec("1001")
addBinary("1010", "1011")
