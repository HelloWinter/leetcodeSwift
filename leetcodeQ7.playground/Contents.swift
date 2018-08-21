//: Playground - noun: a place where people can play

import UIKit

/*反转整数
 给定一个 32 位有符号整数，将整数中的数字进行反转。
 
 示例 1:
 
 输入: 123
 输出: 321
 示例 2:
 
 输入: -123
 输出: -321
 示例 3:
 
 输入: 120
 输出: 21
 注意:
 
 假设我们的环境只能存储 32 位有符号整数，其数值范围是 [−231,  231 − 1]。根据这个假设，如果反转后的整数溢出，则返回 0。
 */

func reverse(_ source : Int) -> Int{
    if source == 0 {
        return 0
    }
    var strResult = ""
    var temp = abs(source)
    while temp != 0 {
        strResult.append("\(temp % 10)")
        temp /= 10;
    }
    let sign = source > 0 ? 1 : -1
    if let unsignResult = toInt(strResult){
        let result = unsignResult * sign
        if result > Int32.max || result < Int32.min {
            return 0
        }
        return result
    }
    return 0
}

func toInt(_ sourceStr : String) -> Int? {
    return NumberFormatter().number(from: sourceStr)?.intValue
}

reverse(123)
