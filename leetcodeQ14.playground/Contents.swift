//: Playground - noun: a place where people can play

import UIKit

/**最长公共前缀
 编写一个函数来查找字符串数组中的最长公共前缀。
 
 如果不存在公共前缀，返回空字符串 ""。
 
 示例 1:
 
 输入: ["flower","flow","flight"]
 输出: "fl"
 示例 2:
 
 输入: ["dog","racecar","car"]
 输出: ""
 解释: 输入不存在公共前缀。
 说明:
 
 所有输入只包含小写字母 a-z 。
 */


func longestCommonPrefix(_ strs: [String]) -> String {
    let firstString = strs.first!
    var prefix = ""
    let startIndex = firstString.startIndex
    var index = startIndex
    while index < firstString.endIndex {
        index = firstString.index(index, offsetBy: 1)
        prefix = String(firstString[startIndex..<index])
        for i in 1..<strs.count {
            if !strs[i].hasPrefix(prefix){
                return String(firstString[startIndex..<firstString.index(index, offsetBy: -1)])
            }
        }
    }
    return prefix
}

longestCommonPrefix(["flow","flow","flo"])
