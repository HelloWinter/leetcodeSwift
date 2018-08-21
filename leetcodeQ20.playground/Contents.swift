//: Playground - noun: a place where people can play

import UIKit

/**有效的括号
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。
 
 有效字符串需满足：
 
 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
 注意空字符串可被认为是有效字符串。
 
 示例 1:
 
 输入: "()"
 输出: true
 示例 2:
 
 输入: "()[]{}"
 输出: true
 示例 3:
 
 输入: "(]"
 输出: false
 示例 4:
 
 输入: "([)]"
 输出: false
 示例 5:
 
 输入: "{[]}"
 输出: true
 */
/**
 思路：模拟一个栈数据结构，遍历字符串，遇到左括号入栈，遇到右括号，对比栈顶字符串，如果相匹配则出栈，继续遍历，如果和栈顶数据不匹配则返回false，如果遍历完成，栈为空则返回true
 */

struct stack{
    fileprivate var array = [String]()
    
    mutating func push(_ element : String){
        array.append(element)
    }
    mutating func pop() -> String?{
        return array.popLast()
    }
    func peek() -> String {
        return array.last ?? ""
    }
    func isEmpty() -> Bool {
        return array.isEmpty
    }
}

func isValid(_ s: String) -> Bool {
    let bracket = ["(" : ")","{" : "}","[" : "]"]
    var index = s.startIndex;
    var tempStack = stack()
    
    while index < s.endIndex {
        let c = String(s[index])
        if bracket.keys.contains(c) {
            tempStack.push(c)
        }else{
            if let rightBracket = bracket[tempStack.peek()],rightBracket == c {
                tempStack.pop()
            }else{
                return false
            }
        }
        index = s.index(index, offsetBy: 1)
    }
    return tempStack.isEmpty() ? true : false
}

isValid("({})[]")
