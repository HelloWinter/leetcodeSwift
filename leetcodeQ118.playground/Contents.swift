//: Playground - noun: a place where people can play

import Foundation

/**杨辉三角
 给定一个非负整数 numRows，生成杨辉三角的前 numRows 行
 在杨辉三角中，每个数是它左上方和右上方的数的和。
 */

func generate(_ numRows: Int) -> [[Int]] {
    var arr = [[Int]]()
    for i in 0..<numRows {
        if i == 0 {
            arr.append([1])
        }else{
            arr.append(creatNextArray(arr: arr[i-1]))
        }
    }
    return arr
}

func creatNextArray(arr : [Int]) -> [Int]{
    var newArray = [Int]()
    newArray.append(1)
    for i in 0..<arr.count-1 {
        newArray.append(arr[i] + arr[i+1])
    }
    newArray.append(1)
    return newArray
}

print(generate(5))

