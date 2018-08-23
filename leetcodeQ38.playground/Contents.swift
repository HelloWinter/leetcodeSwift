//: Playground - noun: a place where people can play

import Foundation

/**报数
 报数序列是指一个整数序列，按照其中的整数的顺序进行报数，得到下一个数。其前五项如下：
 
 1.     1
 2.     11
 3.     21
 4.     1211
 5.     111221
 1 被读作  "one 1"  ("一个一") , 即 11。
 11 被读作 "two 1s" ("两个一"）, 即 21。
 21 被读作 "one 2",  "one 1" （"一个二" ,  "一个一") , 即 1211。
 
 给定一个正整数 n ，输出报数序列的第 n 项。
 
 注意：整数顺序将表示为一个字符串。
 
 示例 1:
 
 输入: 1
 输出: "1"
 示例 2:
 
 输入: 4
 输出: "1211"
 */

/**
 思路：要想找到第n个，需要知道第n-1个,依次递归。。。
 */

func countAndSay(_ n: Int) -> String {
    var lastStr = "1"
    for i in 1..<n {
        lastStr = count(lastStr)
    }
    return lastStr
}

func count(_ strPre : String) -> String {
    var index = strPre.startIndex
    var count = 1
    var result = ""
    while index < strPre.endIndex {
        let c = String(strPre[index])
        let nextIndex = strPre.index(index, offsetBy: 1)
        if nextIndex == strPre.endIndex {
            result += "\(count)\(c)"
        }else{
            let nextc = String(strPre[nextIndex])
            if c == nextc {
                count += 1
            }else{
                result += "\(count)\(c)"
                count = 1
            }
        }
        index = nextIndex
    }
    return result
}

//count("11")
print(countAndSay(10))

